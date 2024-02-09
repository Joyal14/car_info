import 'package:flutter/material.dart';

class CustomContainers extends StatelessWidget {
  final String text;
  final int selectedText;

  const CustomContainers(
      {Key? key, required this.text, required this.selectedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 50,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        color: Color.fromARGB(98, 107, 106, 106),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 50,
              ),
              if (selectedText >= 1)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                          5), // Optional: Add border radius for rounded corners
                    ),
                    padding: const EdgeInsets.all(
                        8), // Optional: Add padding to the container
                    child: Center(
                      child: Text(
                        selectedText.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
