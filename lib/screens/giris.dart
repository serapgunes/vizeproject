import 'package:flutter/material.dart';

class giris extends StatelessWidget {
  const giris({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 120.0,
              ),
              SizedBox(height: 40.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 12.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                 
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/homepage', (Route<dynamic> route) => false);},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //primary: Color.fromARGB(255, 242, 112, 162),
                ),
                child: Text(
                  'Giriş Yap',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              SizedBox(height: 12.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Şifremi Unuttum',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 12.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Hemen Üye Ol',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

