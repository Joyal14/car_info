// main.dart
import 'package:flutter/material.dart';
import 'package:ork_app/SplashScreen/splash_Screen.dart';
import 'package:ork_app/home_page.dart';
import 'package:ork_app/login_manager.dart';
import 'package:ork_app/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool loggedIn = await LoginManager.isLoggedIn();

  runApp(MyApp(initialRoute: loggedIn ? '/home' : '/login'));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        // Add other routes as needed
      },
    );
  }
}
