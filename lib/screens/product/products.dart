
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:vizeproje/bloc/client/client_cubit.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/cart/cart_cubit.dart';
import '../../bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/localizations.dart';
import '../homepage.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var products = [
    {
      "id": 1,
      "name": "MacBook Pro 2024 M2 Pro",
      "in-stock": true,
      "price": 65000.00,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 2,
      "name": "iPhone 15 Pro Max",
      "in-stock": false,
      "price": 0,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 3,
      "name": "Asus VivoBook",
      "in-stock": true,
      "price": 35000.00,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 4,
      "name": "Xiami X",
      "in-stock": true,
      "price": 15999.00,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 5,
      "name": "Samsung S23",
      "in-stock": false,
      "price": 0,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 6,
      "name": "Lenovo X1",
      "in-stock": true,
      "price": 43000.00,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
    {
      "id": 7,
      "name": "Deneme X1",
      "in-stock": true,
      "price": 43000.00,
      "photo":
          "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/refurb-mbp14-m2-silver-202303?wid=2000&hei=1536&fmt=jpeg&qlt=95&.v=1680103614090",
    },
  ];

  late ProductsCubit productsCubit;
  late CartCubit cartCubit;
  late ClientCubit clientCubit;

  @override
  void initState() {
    super.initState();
    productsCubit = context.read<ProductsCubit>();
    cartCubit = context.read<CartCubit>();
    clientCubit = context.read<ClientCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).getTranslate("products")),
        actions: [
          if (clientCubit.state.darkMode)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: false);
                  },
                  icon: Icon(Icons.sunny)),
            )
          else
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    clientCubit.changeDarkMode(darkMode: true);
                  },
                  icon: Icon(Icons.nightlight)),
            ),
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
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => GoRouter.of(context).push("/cart"),
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      //sol menu baslangic /drawer

      backgroundColor: Theme.of(context).backgroundColor,
      drawer: Drawer(
        child: Column(
          children: [
            InkWell(
              //onTap: () {
              //  Navigator.pushNamed(context, '/profile');
              //},
              onTap: () => context.push("/profile"),
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/logo.png'),
                      radius: 35,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Serap',
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
                    onTap: () => context.push("/homepage")),
                  MenuItem(
                    title: "Hakkımızda",
                    icon: SvgPicture.asset(
                      "assets/icons/about.svg",
                      height: 23,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/about");
                    },
                  ),
                  MenuItem(
                    title: "Favoriler",
                    icon: SvgPicture.asset(
                      "assets/icons/love.svg",
                      height: 23,
                    ),
                    onTap: () => context.push("/favorites"),
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
                  //deneme product
                  MenuItem(
                      title: "ürünler",
                      icon: SvgPicture.asset(
                        "assets/icons/trolley.svg",
                        height: 23,
                      ),
                      onTap: () => context.push("/products")
                      ),
                                        MenuItem(
                          title: "silincek",
                          icon: SvgPicture.asset(
                            "assets/icons/trolley.svg",
                            height: 23,
                          ),
                          onTap: () => context.push("/silincek")),
                  //deneme product
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
                  //deneme OutlinedButton
                  OutlinedButton(
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
                                Gap(40),
                                Text(
                                  'This is a BottomSheet',
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
                                CheckboxListTile(
                                  value: clientCubit.state.darkMode,
                                  onChanged: (value) {
                                    if (value == null)
                                      clientCubit.changeDarkMode(
                                          darkMode: false);
                                    else
                                      clientCubit.changeDarkMode(
                                          darkMode: value);
                                  },
                                  secondary: clientCubit.state.darkMode
                                      ? const Icon(Icons.sunny)
                                      : const Icon(Icons.nightlight),
                                  title: const Text('Gece Modu'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Close BottomSheet'),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Temel Ayarlar"),
                  ),
                  const Gap(10),
                  //deneme OutlinedButton
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
      //sol menu bitis /drawer


            body:
       BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                // Handle product tap
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        Theme.of(context).colorScheme.secondary.withAlpha(50),
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          products[index]["photo"].toString(),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      products[index]["name"].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          products[index]["price"] == 0
                              ? AppLocalizations.of(context)
                                  .getTranslate("free")
                              : "${products[index]["price"]} ₺",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products[index]["name"].toString()),
                            if (productsCubit
                                .isFavorite(products[index]["id"] as int))
                              IconButton(
                                  onPressed: () {
                                    productsCubit.removeFromFavorites(
                                        products[index]["id"] as int);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ))
                            else
                              IconButton(
                                  onPressed: () {
                                    productsCubit
                                        .addToFavorites(products[index]);
                                  },
                                  icon: const Icon(Icons.favorite_border))
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        cartCubit.sepeteEkle(
                          id: products[index]["id"] as int,
                          photo: products[index]["photo"].toString(),
                          ad: products[index]["name"].toString(),
                          sayi: 1,
                          fiyat: products[index]["price"] as double,
                        );

                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(AppLocalizations.of(context)
                                .getTranslate("cart")),
                            content: Text(AppLocalizations.of(context)
                                .getTranslate("added-to-cart")),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () =>
                                        GoRouter.of(context).push("/cart"),
                                    child: Text("Sepete Git"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => GoRouter.of(context).pop(),
                                    child: Text("X"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)
                          .getTranslate("add_to_basket")),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
