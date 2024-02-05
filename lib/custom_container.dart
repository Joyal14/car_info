import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String labelText;
  final String valueText;
  final String imagePath;
  final double containerWidth;

  // ignore: use_key_in_widget_constructors
  const CustomContainer({
    required this.labelText,
    required this.valueText,
    required this.imagePath,
    required this.containerWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(136, 91, 90, 90),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(188, 112, 111, 111),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labelText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            valueText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
