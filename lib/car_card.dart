import 'package:flutter/material.dart';

Widget buildCarCard() {
  return Container(
    width: 200,
    margin: const EdgeInsets.only(right: 10),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      color: Color.fromARGB(98, 107, 106, 106),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            image: DecorationImage(
              image: AssetImage(
                  'image/Frame.png'), // Replace with your image asset
              fit: BoxFit.fill,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Car Model',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 4),
              Text('Year | Mileage | Location',
                  style: TextStyle(fontSize: 12, color: Colors.white)),
              SizedBox(height: 4),
              Text('₹ Price',
                  style: TextStyle(fontSize: 14, color: Colors.blue)),
            ],
          ),
        ),
      ],
    ),
  );
}
