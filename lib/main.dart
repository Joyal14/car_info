import 'package:flutter/material.dart';
import 'package:ork_app/SplashScreen/splash_Screen.dart';
import 'package:ork_app/pages/filter_car_info.dart';
import 'package:ork_app/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while checking login state
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            ),
          );
        } else {
          final isLoggedIn = snapshot.data ?? false;
          return MaterialApp(
            home: isLoggedIn
                // ? HomePage()
                ? HomePage()
                : SplashScreen(), // Navigate to HomePage if logged in, otherwise to LocationPage
          );
        }
      },
    );
  }

  Future<bool> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
