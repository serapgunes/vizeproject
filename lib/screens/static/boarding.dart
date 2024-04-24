// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:preload_page_view/preload_page_view.dart';

// import '../../core/storage.dart';
// import '../../widgets/page/boarding_item.dart';

// class BoardingScreen extends StatefulWidget {
//   const BoardingScreen({super.key});

//   @override
//   State<BoardingScreen> createState() => _BoardingScreenState();
// }

// class _BoardingScreenState extends State<BoardingScreen> {

//   final boardingData = [
//     {
//       "image": "",
//       "title": "1 falan",
//       "description": "reklamreklamreklamreklamreklamreklamreklamreklam falan",
//     },
//     {
//       "image": "",
//       "title": "1 falan",
//       "description": "reklamreklamreklamreklamreklamreklamreklamreklam falan",
//     },
//     {
//       "image": "",
//       "title": "1 falan",
//       "description": "reklamreklamreklamreklamreklamreklamreklamreklam falan",
//     }
//   ];
//   int page = 0;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 20.0),
//             child: InkWell(
//               onTap: () async {
//                 final storage = Storage();
//                 await storage.firstLaunch();
//                 GoRouter.of(context).replace("/homepage");
//               },
//               child:Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: page == 2 ? const Text("Home") : const  Text("Skip"), //son sayfadaysa home, değilse skip
//               )),
//           )
//         ],
//       ),
//       body:SafeArea(
//         child: PreloadPageView.builder(
//           itemCount: boardingData.length, //data uzunlugu kadar uret
//           preloadPagesCount: boardingData.length, //datanın hepsini çek
//           onPageChanged: (value) {
//             setState(() {
//               page = value;
//             });
//           },
//           itemBuilder: (context, index) => BoardingItem(
//             image: boardingData [index] ["image"]!,
//             title: boardingData [index] ["title"]!,
//             description: boardingData [index] ["description"]!),),)
//     ,bottomNavigationBar: SizedBox(
//       height: 70,
//     child: Align(
//       alignment: Alignment.center, //hizalama için kullanilir.
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: boardingData.length,
//         itemBuilder: (context, index) => Icon(
//             page == index
//              ? CupertinoIcons.circle_filled
//              : CupertinoIcons.circle,
//           ),),
//     )
//     ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../core/storage.dart';
import '../../widgets/page/boarding_item.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final List<Map<String, String>> boardingData = [
    {
      "image": "assets/images/onboarding1.png",
      "title": "Keşfet",
      "description": "En yeni ürünleri keşfedin ve harika fırsatları yakalayın.",
    },
    {
      "image": "assets/images/onboarding2.png",
      "title": "Favorilerinizi Bulun",
      "description": "Favori ürünlerinizi kolayca bulun ve listelerinizi oluşturun.",
    },
    {
      "image": "assets/images/onboarding3.png",
      "title": "Güvenli Alışveriş",
      "description": "Güvenli ödeme yöntemleri ile hızlı ve kolay alışveriş yapın.",
    },
  ];

  int currentPage = 0;

  void _updatePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void _navigateToHome(BuildContext context) async {
    final storage = Storage();
    await storage.firstLaunch();
    GoRouter.of(context).replace('/homepage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => _navigateToHome(context),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(currentPage == boardingData.length - 1 ? 'Başla' : 'Geç'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PreloadPageView.builder(
          itemCount: boardingData.length,
          preloadPagesCount: boardingData.length,
          onPageChanged: _updatePage,
          itemBuilder: (context, index) {
            return BoardingItem(
              image: boardingData[index]['image']!,
              title: boardingData[index]['title']!,
              description: boardingData[index]['description']!,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              boardingData.length,
              (index) => Icon(
                currentPage == index ? CupertinoIcons.circle_fill : CupertinoIcons.circle,
                size: 10.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}