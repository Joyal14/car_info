import 'package:flutter/material.dart';
import 'package:ork_app/SplashScreen/splash_Screen.dart';
import 'package:ork_app/login_page.dart';
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
          return const CircularProgressIndicator(); // Show loading indicator while checking login state
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
            debugShowCheckedModeBanner: false,
            initialRoute: isLoggedIn
                ? '/home'
                : '/login', // Set initial route based on login state
            routes: {
              '/login': (context) => LoginPage(
                  handleLogout:
                      _handleLogout), // Pass _handleLogout function to LoginPage
              '/home': (context) => HomePage(),
              // Add more routes if needed
              '/splash': (context) => SplashScreen(),
            },
          );
        }
      },
    );
  }

  Future<bool> checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  // Define the logout function
  void _handleLogout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn'); // Clear isLoggedIn flag
    Navigator.pushReplacementNamed(
        context, '/splash'); // Navigate to login page
  }
}
