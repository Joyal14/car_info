import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class custom_textfield extends StatelessWidget {
  final String? hintText;
  final TextInputType? inputType;
  final TextInputFormatter formate;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Color? color;
  final TextEditingController controller;

  const custom_textfield({
    this.hintText,
    this.inputType,
    required this.textInputType,
    required this.textAlign,
    required this.formate,
    required this.controller,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        textAlign: textAlign,
        keyboardType: textInputType,
        inputFormatters: [formate],
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          fillColor: color,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(250, 119, 118, 118),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 18.0,
    this.color = Colors.white,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color, // Set the default color to white
      ),
    );
  }
}
