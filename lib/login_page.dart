import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ork_app/custom_textfield.dart';
import 'package:ork_app/models/otp_model.dart';
import 'package:ork_app/otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  // ignore: override_on_non_overriding_member
  final TextEditingController mobileController = TextEditingController();
  final RegExp mobileRegex =
      RegExp(r'^[6789]\d{9}$'); // Regex for Indian mobile numbers

  final dio = Dio();
  // ignore: prefer_typing_uninitialized_variables
  var jsonList;

  void postData() async {
    if (mobileController.text.isNotEmpty) {
      var response = await Dio().post(
          "https://dev-api.orkindia.com/api/v1/users/sendotp",
          data: {"phone": mobileController.text, "signCode": ""});
      if (response.statusCode == 200) {
        Otp otpResponse = Otp.fromJson(response.data);
        showMessage('OTP sent successfully');
        print(otpResponse.toJson());
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  OtpPage(phoneNumber: mobileController.text)),
        );
        // print(response);
      }
      // print(response);
      // final parsedJson = convert.jsonDecode(data);
    }
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
                            onPressed: () {
                              if (validateMobileNumber()) {
                                postData();
                              } else {
                                // Show an error message for invalid mobile number
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Invalid mobile number'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue,
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
