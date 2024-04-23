import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'storage.dart'; //Bu sayfa yuklenme/bekleme icin yapildi

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
//uyg. ilk calistiginda her ne yapilacaksa buradan yap. baslar
loadApp()async {
  final storage = Storage(); //hafiza yoneticisinden nesne uretiyoruz
  storage.clearStorage(); //uyg ilk girmiş haline döndürür.//YORUMA ALICAM
  final firstLaunch = await storage.isFirstLaunch();

  if(firstLaunch){
    //ilk calismaysa tanitima yonlendir.
    //cihazin gece gunduz modna erismek
    const darkMode = ThemeMode.system==ThemeMode.dark;
    //cihazin varsayilan diline erismek icin
    final String defaultLocate = Platform.localeName;
    final langParts = defaultLocate.split("_"); //kelmeler arasina bosluk koyarak parcalar

    final supportedLanguages = ["en", "tr", "fr", "es"]; //desteklenen diller
    final finalLang; //kararlastirilan dil buraya yerlestirilecek

    if(supportedLanguages.contains(langParts[0])){ //contains > iceriyor mu
    finalLang = langParts[0];
    }
    else{
      finalLang = "en";
    } 

    await storage.setConfig(language: finalLang, darkMode: darkMode);


    GoRouter.of(context).replace("/boarding");
  }
  else{
    //anasayfaya yonlendir
    
    //final config = await storage.getConfig();
    //final config = await storage.getConfig();
    GoRouter.of(context).replace("/home");
  }
}

@override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:CircularProgressIndicator(),
      ),
    );
  }
}