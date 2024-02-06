import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ork_app/custom_textfield.dart';
import 'package:ork_app/pages/home_page.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController detailsController = TextEditingController();

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
                height: 110,
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
                height: 418,
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
                          "Fill Your Information",
                          style: TextStyle(
                              color: Color.fromRGBO(50, 187, 255, 1),
                              fontWeight: FontWeight.normal,
                              fontSize: 22),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        custom_textfield(
                          controller: detailsController,
                          textInputType: TextInputType.name,
                          hintText: "Name",
                          inputType: TextInputType.name,
                          formate: LengthLimitingTextInputFormatter(30),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        custom_textfield(
                          controller: detailsController,
                          textInputType: TextInputType.name,
                          hintText: "Email",
                          inputType: TextInputType.emailAddress,
                          formate: LengthLimitingTextInputFormatter(30),
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        custom_textfield(
                          controller: detailsController,
                          textInputType: TextInputType.name,
                          hintText: "Address",
                          inputType: TextInputType.streetAddress,
                          formate: LengthLimitingTextInputFormatter(50),
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
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Text("NEXT"),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
