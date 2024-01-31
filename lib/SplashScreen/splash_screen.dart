import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ork_app/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Add a delay to simulate the splash screen duration
    Timer(
      const Duration(seconds: 3),
      () {
        // Navigate to the Onboarding screen after the splash screen duration
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 290,
          ),
          Center(
            child: Image.asset(
              'image/ork.png',
              height: 200,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          Image.asset(
            'image/bottom.png',
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
