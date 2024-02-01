import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ork_app/home_page.dart';
import 'package:ork_app/login_manager.dart';
import 'package:ork_app/main.dart';
import 'package:ork_app/models/successfull_otp_send_model.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  OtpPage({required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class TokenManager {
  static const String keyAccessToken = 'access_token';

  static Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyAccessToken, "Bearer $accessToken");
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyAccessToken);
  }

  static Future<void> removeAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyAccessToken);
  }

  static const String keyPhoneNumber = 'phone_number';

  static Future<void> savePhoneNumber(String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyPhoneNumber, phoneNumber);
  }

  static Future<String?> getPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyPhoneNumber);
  }
}

class _OtpPageState extends State<OtpPage> {
  final List<TextEditingController> otpControllers =
      List.generate(5, (index) => TextEditingController());
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List.generate(5, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  Future<void> submitOtp(String otp) async {
    const String apiUrl = 'https://dev-api.orkindia.com/api/v1/users/login';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String phoneNumber = widget.phoneNumber;

      final dio = Dio();

      // Retrieve the access token from SharedPreferences
      String? accessToken = await TokenManager.getAccessToken();

      // Check if the access token is available
      if (accessToken != null && accessToken.isNotEmpty) {
        // Include the access token in the headers
        dio.options.headers['Authorization'] = 'Bearer $accessToken';
      }

      final response = await dio.post(
        apiUrl,
        data: {'phone': phoneNumber, 'otp': otp},
      );

      if (response.statusCode == 200) {
        SuccessFullOtpSend otpResponse =
            SuccessFullOtpSend.fromJson(json.decode(response.toString()));

        if (otpResponse.status?.code == 1) {
          print(phoneNumber);
          print("invalid(1)");
        } else if (otpResponse.status?.code == 0) {
          String newAccessToken = otpResponse.data?.accessToken ?? '';
          await TokenManager.saveAccessToken(newAccessToken);

          // Set the code '1' in SharedPreferences to indicate successful login
          await prefs.setInt('loginCode', 1);

          print('New Access Token: $newAccessToken');
          print("success");

          // Check if the user is already logged in (e.g., using a flag in SharedPreferences)
          bool isLoggedIn = await LoginManager.isLoggedIn();

          // If the user is not already logged in, navigate to the home page
          if (!isLoggedIn) {
            // Use the Navigator to push the home page onto the navigation stack
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.data}");
        // Handle the error appropriately
      }
    } catch (e) {
      print('Exception during API call: $e');
      // Handle the exception appropriately
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: screenHeight * 0.2, bottom: screenHeight * 0.02),
            child: Image.asset('image/ork.png',
                width: screenWidth * 0.5, height: screenHeight * 0.15),
          ),
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.7,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Positioned.fill(
                    child: Image.asset('image/bottom.png', fit: BoxFit.fill),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.39,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 43, 43, 43),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enter OTP',
                        style: TextStyle(fontSize: 18, color: Colors.blue)),
                    Text('Please enter the OTP',
                        style: TextStyle(fontSize: 17, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    5,
                    (index) => SizedBox(
                      width: 50,
                      child: TextFormField(
                        controller: otpControllers[index],
                        focusNode: focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 43, 43, 43),
                        ),
                        onChanged: (value) {
                          if (value.length == 1 && index < 4) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index + 1]);
                          } else if (value.isEmpty && index > 0) {
                            FocusScope.of(context)
                                .requestFocus(focusNodes[index - 1]);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String otp = otpControllers
                        .map((controller) => controller.text)
                        .join();
                    if (otp.length == 5) {
                      await submitOtp(otp);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a valid OTP'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text('Submit',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 208, 208, 208))),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text('Resend OTP',
                      style: TextStyle(fontSize: 18, color: Colors.blue)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
