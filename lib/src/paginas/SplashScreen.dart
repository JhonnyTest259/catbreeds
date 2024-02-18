import 'dart:async';

import 'package:catbreeds/src/paginas/BreedScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simular un tiempo de espera de 2 segundos antes de pasar a la pantalla principal
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BreedScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Catbreeds!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Image.asset('assets/cat.webp')
          ],
        ),
      ),
    );
  }
}
