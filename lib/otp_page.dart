import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ork_app/custom_textfield.dart';
import 'package:ork_app/details_page.dart';

class OTPPage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();

  // final dio = Dio();
  // // ignore: prefer_typing_uninitialized_variables
  // var jsonList;

  // void postData() async {
  //   if (otpController.text.isNotEmpty) {
  //     var response = await Dio().post(
  //         "https://dev-api.orkindia.com/api/v1/users/sendotp",
  //         data: {"phone": otpController.text, "signCode": ""});
  //     if (response.statusCode == 200) {
  //       String otpToJson(Otp data);
  //       print(otpResponse.toJson());
  //       // ignore: use_build_context_synchronously
  //       Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(
  //           builder: (context) => OTPPage(),
  //         ),
  //       );
  //       // print(response);
  //     }
  //     // print(response);
  //     // final parsedJson = convert.jsonDecode(data);
  //   }
  // }

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
                        const Row(
                          children: [
                            Text(
                              "Enter OTP",
                              style: TextStyle(
                                  color: Color.fromRGBO(50, 187, 255, 1),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              width: 120,
                            ),
                            Text(
                              "Enter OTP here",
                              style: TextStyle(
                                  color: Color.fromRGBO(148, 148, 223, 1),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 22),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: custom_textfield(
                              controller: otpController1,
                              textInputType: TextInputType.number,
                              inputType: TextInputType.phone,
                              formate: LengthLimitingTextInputFormatter(1),
                              textAlign: TextAlign.center,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: custom_textfield(
                              controller: otpController2,
                              textInputType: TextInputType.number,
                              inputType: TextInputType.phone,
                              formate: LengthLimitingTextInputFormatter(1),
                              textAlign: TextAlign.center,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: custom_textfield(
                              controller: otpController3,
                              textInputType: TextInputType.number,
                              inputType: TextInputType.phone,
                              formate: LengthLimitingTextInputFormatter(1),
                              textAlign: TextAlign.center,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: custom_textfield(
                              controller: otpController4,
                              textInputType: TextInputType.number,
                              inputType: TextInputType.phone,
                              formate: LengthLimitingTextInputFormatter(1),
                              textAlign: TextAlign.center,
                            )),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Center(
                              child: custom_textfield(
                                controller: otpController5,
                                textInputType: TextInputType.number,
                                inputType: TextInputType.phone,
                                formate: LengthLimitingTextInputFormatter(1),
                                textAlign: TextAlign.center,
                              ),
                            ))
                          ],
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
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => DetailsPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text("Submit"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(color: Colors.blue, fontSize: 20),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
