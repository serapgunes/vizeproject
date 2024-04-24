import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../bloc/cart/cart_cubit.dart';
import '../bloc/client/client_cubit.dart';
import '../core/localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ClientCubit clientCubit;
  late CartCubit cartCubit;
  TextEditingController ilKoduYoneticisi = TextEditingController(text: "34");

  @override
  void initState() {
    super.initState();
    clientCubit = context.read<ClientCubit>();
    cartCubit = context.read<CartCubit>();
    ilKodlariniOku();
  }

  Map<String, dynamic> states = {};

  ilKodlariniOku() async {
    String iller = await rootBundle.loadString('assets/json/states.json');

    Map<String, dynamic> json = jsonDecode(iller);

    setState(() {
      states = json;
    });

    print(json);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withAlpha(150),
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.rollingstone.com/wp-content/uploads/2023/02/elon-twitter-new-ceo.jpg?w=1581&h=1054&crop=1",
                        ),
                        maxRadius: 42,
                      ),
                    ),
                    const Gap(20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Elon Musk",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          "Kullanici",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withAlpha(150)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                selected: true,
                // enabled: false,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                ),
                title: const Text('Hakkimizda'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Kategoriler'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.train,
                ),
                title: const Text('Markalar'),
                onTap: () => context.push("/brands"),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(
                  Icons.help_center,
                ),
                title: const Text('Iletisim'),
                onTap: () {
                  Navigator.pop(context);
                },
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
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("home_title")),
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
          ],
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: ListView(
              children: [
                InkWell(
                    onTap: () => GoRouter.of(context).push("/ali"),
                    child: const Text("HomeScreen")),
                Text("Language: " + clientCubit.state.language),
                Text("DarkMode: " + clientCubit.state.darkMode.toString()),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "en"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "en");
                              },
                        child: Text("English")),
                    Gap(10),
                    ElevatedButton(
                        onPressed: clientCubit.state.language == "tr"
                            ? null
                            : () {
                                clientCubit.changeLanguage(language: "tr");
                              },
                        child: Text("Turkce")),
                  ],
                ),
                const Divider(),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/products");
                    },
                    child: Text(
                        AppLocalizations.of(context).getTranslate("products"))),
                const Gap(20),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push("/payment");
                  },
                  child: const Text("Odeme"),
                ),
                const Gap(20),
                ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).push("/settings");
                    },
                    child: Text(
                        AppLocalizations.of(context).getTranslate("settings"))),
                const SizedBox(height: 50),
                OutlinedButton(
                    onPressed: () => context.push("/preview"),
                    child: const Text("Temalandirma")),
                const Gap(10),
                OutlinedButton(
                    onPressed: () => context.push("/ip"),
                    child: const Text("IP 2 Location")),
                const Gap(10),
                OutlinedButton(
                    onPressed: () => context.push("/translate"),
                    child: const Text("Dictionary API")),
                const Gap(10),
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
                                    clientCubit.changeDarkMode(darkMode: false);
                                  else
                                    clientCubit.changeDarkMode(darkMode: value);
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
                OutlinedButton(
                  onPressed: () {
                    context.push("/brands");
                  },
                  child: const Text("Markalar"),
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ListView(
                        padding: const EdgeInsets.symmetric(vertical: 35),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              AppLocalizations.of(context)
                                  .getTranslate("select-language"),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Gap(20),
                          ListTile(
                              title: const Text("Turkce"),
                              leading: const Icon(Icons.language),
                              enabled: clientCubit.state.language != "tr",
                              subtitle: const Text("Turkish (Turkiye)"),
                              onTap: () =>
                                  clientCubit.changeLanguage(language: "tr")),
                          ListTile(
                            title: const Text("English"),
                            enabled: clientCubit.state.language != "en",
                            leading: const Icon(Icons.language),
                            subtitle: const Text("English (United States)"),
                            onTap: () =>
                                clientCubit.changeLanguage(language: "en"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text("Dil Secimi"),
                ),
                const SizedBox(height: 50),
                const Text("LOVE U ALL"),
                const Icon(Icons.favorite, size: 90, color: Colors.red),
                const Text("Keyvan Arasteh."),
                TextField(
                  controller: ilKoduYoneticisi,
                ),
                const Gap(10),
                OutlinedButton(
                  onPressed: () {
                    if (states.containsKey(ilKoduYoneticisi.text)) {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text(states[ilKoduYoneticisi.text]),
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Text("Bulunamadi"),
                              ));
                    }
                  },
                  child: const Text("Ara"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
