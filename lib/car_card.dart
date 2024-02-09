import 'package:flutter/material.dart';
import 'package:ork_app/models/vechile_model.dart'; // Import your model file

class CarCard extends StatefulWidget {
  final VechileListModel data;
  // Assuming 'Doc' is the class representing your car data

  const CarCard({super.key, required this.data});

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  @override
  Widget build(BuildContext context) {
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
              // image: DecorationImage(
              //   image: NetworkImage(
              //     , // Replace with your image asset
              //   ),
              //   fit: BoxFit.fill,
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.data.brandData?.brandName ?? 'Brand Name'} ${widget.data.modelData?.modelName ?? ''}', // Use the actual property from your data
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${widget.data.yearData?.year ?? ''} | ${widget.data.mileage ?? ''} | ${widget.data.location ?? ''}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                const SizedBox(height: 2),
                Text(
                  '₹ ${widget.data.price ?? 'Price'}',
                  style: const TextStyle(fontSize: 12, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
