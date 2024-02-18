import 'package:catbreeds/src/screen.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/router/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CATBREEDS',
      initialRoute: AppRoutes.initialRoute,
      home: SplashScreen(),
    );
  }
}
