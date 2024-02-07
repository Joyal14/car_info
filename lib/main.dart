import 'package:flutter/material.dart';
import 'package:ork_app/SplashScreen/splash_Screen.dart';
import 'package:ork_app/pages/home_page.dart';
import 'package:ork_app/pages/location_page.dart';

void main() {
  runApp(const MyApp(
    initialRoute: '',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required String initialRoute});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LocationPage(),
    );
  }
}
