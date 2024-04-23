import 'package:flutter/material.dart';


import 'screens/buy.dart';
import 'screens/giris.dart';
import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => homepage(),
        //'/login':(context) => loginscreen(),
        //'/profil':(context) => profilscreen(),
        //'/welcome': (context) => welcomescreen(),
        '/giris':(context) => giris(),
        //'/shop':(context) => shop(),
        //'/about': (context) => about(),
        //'/bag': (context) => bag(),
        //'/clothes': (context) => clothes(),
        '/buy':(context) =>buy()

      },
      initialRoute: '/giris',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
      ),
    );
  }
}
