import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
