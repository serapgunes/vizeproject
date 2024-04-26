import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeproje/bloc/client/client_cubit.dart';
import 'package:vizeproje/screens/product/products.dart';
import 'package:gap/gap.dart';
import '../core/localizations.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key});

  @override
  State<homepage> createState() => _HomePageState();
}

class _HomePageState extends State<homepage> {
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 60,
                  ),
                  //Text(
                  //AppLocalizations.of(context).getTranslate("homepage"),
                  //),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: IconButton(
                  onPressed: () {
                    if (clientCubit.state.language == "tr") {
                      clientCubit.changeLanguage(language: "en");
                    } else {
                      clientCubit.changeLanguage(language: "tr");
                    }
                  },
                  icon: Icon(Icons.language),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 2.0),
                child: IconButton(
                  onPressed: () => GoRouter.of(context).push("/favorites"),
                  icon: Icon(Icons.favorite),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          
          drawer: Drawer(
            child: Column(
              children: [
                InkWell(
                                          onTap: () => context.push("/profile"),

                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/logo.png'),
                          radius: 35,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Serap & Ceylan',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      MenuItem(
                        title: "AnaSayfa",
                        icon: SvgPicture.asset(
                          "assets/icons/home.svg",
                          height: 23,
                        ),
                        onTap: () => context.push("/profile"),
                      ),
                      MenuItem(
                        title: "Hakkımızda",
                        icon: SvgPicture.asset(
                          "assets/icons/about.svg",
                          height: 23,
                        ),
                        onTap: () => context.push("/about")
                      ),
                      MenuItem(
                        title: "Favoriler",
                        icon: SvgPicture.asset(
                          "assets/icons/love.svg",
                          height: 23,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/clothes");
                        },
                      ),
                      MenuItem(
                          title: "Kartlarım",
                          icon: SvgPicture.asset(
                            "assets/icons/credit-card.svg",
                            height: 23,
                          ),
                          // onTap: () {
                          //   Navigator.pushNamed(context, "/payment");
                          // },
                          onTap: () => context.push("/payment")),
                      MenuItem(
                          title: "Sepetim",
                          icon: SvgPicture.asset(
                            "assets/icons/trolley.svg",
                            height: 23,
                          ),
                          onTap: () => context.push("/cart")),
                      MenuItem(
                          title: "ürünler",
                          icon: SvgPicture.asset(
                            "assets/icons/shop.svg",
                            height: 23,
                          ),
                          onTap: () => context.push("/products")),
                       MenuItem(
                          title: "Ürün Detayları",
                          icon: SvgPicture.asset(
                            "assets/icons/file.svg",
                            height: 22,
                          ),
                          onTap: () => context.push("/silincek")),
                     
               Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      IconButton(
      
        icon: Icon(Icons.settings),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                // height: 200,
                // color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40),
                    Icon(Icons.settings),
                    Text(
                      'Ayarlar',
                      style: TextStyle(fontSize: 20),
                    ),
                    SwitchListTile(
                      value: clientCubit.state.darkMode,
                      onChanged: (value) {
                        clientCubit.changeDarkMode(darkMode: value);
                      },
                      secondary: clientCubit.state.darkMode
                          ? const Icon(Icons.sunny)
                          : const Icon(Icons.nightlight),
                      title: const Text('Gece Modu'),
                    ),
                    SwitchListTile(
                      value: clientCubit.state.language == "tr",
                      onChanged: (_) {
                        if (clientCubit.state.language == "tr") {
                          clientCubit.changeLanguage(language: "en");
                        } else {
                          clientCubit.changeLanguage(language: "tr");
                        }
                      },
                      title: const Text("Dil Seçimi"),
                      subtitle: clientCubit.state.language == "tr"
                          ? const Text("English (United States)")
                          : const Text("Turkish (Turkiye)"),
                      secondary: const Icon(Icons.language),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Kapat'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: "Ayarlar",
      ),
      Text("Ayarlar"),
    ],
  ),
)
                    ],
                    
                  ),
                ),
                Divider(),
                MenuItem(
                  icon: Icon(Icons.logout_outlined),
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/welcome', (route) => false);
                  },
                  title: "Çıkış",
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [       
                header(),
                searchBox(),
                titleItem("clots", "View all"),
                nearLocation(),
                SizedBox(height: 200,),
                //ProductsScreen(),
                 Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black12,
              )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.home, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.search, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.smart_display,
                        size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:
                        Icon(Icons.favorite, size: 28, color: Colors.black87),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Icon(Icons.person, size: 28, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
      }
        );
  }
    
  
             
  }

Widget nearLocation() => Container(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 5),
                locationItem("assets/images/apple-logo.png"),
                SizedBox(width: 8),
                locationItem("assets/images/asus.png"),
                SizedBox(width: 8),
                locationItem("assets/images/samsung.png"),
                SizedBox(width: 8),
                locationItem("assets/images/vivo.png"),
                SizedBox(width: 8),
                locationItem("assets/images/xiaomi.png"),
                SizedBox(width: 8),
                locationItem("assets/images/logo.png"),
                SizedBox(width: 8),
                
              ],
            ),
          ),
        ],
      ),
    );

Widget locationItem(String photo) => Container(
      width: 100,
      height: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(24, 1, 1, 1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              photo,
              width: 30,
            ),
          ),
        ],
      ),
    );

Padding titleItem(String title, String link) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 56, 56, 56),
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          link,
          style: TextStyle(
            color: Color.fromARGB(255, 153, 153, 153),
            fontSize: 10,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget searchBox() => Container(
      height: 50,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        border: Border.all(
          color: Color.fromARGB(25, 170, 170, 170),
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/magnifying-glass.svg",
                height: 23,
                color: const Color.fromARGB(255, 171, 166, 166),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search...",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            "assets/icons/audio.svg",
            height: 23,
            color: Colors.black,
          )
        ],
      ),
    );

Widget header() => Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello!",
                style: TextStyle(
                  color: Color.fromARGB(255, 11, 11, 11),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome to our page",
                style: TextStyle(
                  color: Color.fromARGB(255, 190, 187, 187),
                  fontSize: 16,
                  //fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final Function()? onTap;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            icon,
            SizedBox(width: 6),
            Text(title),
          ],
        ),
      ),
    );
  }
}
