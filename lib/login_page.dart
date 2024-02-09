import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ork_app/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ork_app/otp_page.dart'; // Import your OTP page here

class LoginPage extends StatefulWidget {
  const LoginPage(
      {Key? key, required void Function(BuildContext context) handleLogout})
      : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();
  final RegExp mobileRegex = RegExp(r'^[6789]\d{9}$');

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void loginUser() async {
    // Check if mobile number is valid
    if (!validateMobileNumber()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid mobile number'),
        ),
      );
      return;
    }

    // Your login logic here

    // For demonstration purposes, we'll assume login is successful
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);

    // Navigate to OTP page
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OtpPage(phoneNumber: mobileController.text),
      ),
    );
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('isLoggedIn');
    // Navigate back to the login page
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(0.1),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 180,
              ),
              Image.asset('image/ork.png'),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                'image/bottom.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Container(
                width: double.infinity,
                height: 318,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10), right: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Login & Register",
                        style: TextStyle(
                            color: Color.fromRGBO(50, 187, 255, 1),
                            fontWeight: FontWeight.normal,
                            fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      custom_textfield(
                        controller: mobileController,
                        hintText: "Mobile",
                        inputType: TextInputType.phone,
                        textInputType: TextInputType.phone,
                        formate: LengthLimitingTextInputFormatter(10),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed:
                                loginUser, // Call loginUser method when button is pressed
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text("Login"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateMobileNumber() {
    return mobileRegex.hasMatch(mobileController.text);
  }
}
