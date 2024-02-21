import 'package:flutter/material.dart';
import 'package:ork_app/models/showroom_model.dart'; // Import your model file

class ShowRoomCard extends StatefulWidget {
  final ShowRoomModel data;
  // Assuming 'Doc' is the class representing your car data

  const ShowRoomCard({super.key, required this.data});

  @override
  State<ShowRoomCard> createState() => _ShowRoomState();
}

class _ShowRoomState extends State<ShowRoomCard> {
  final String baseImageUrl =
      "https://d2k9wdr6bx93k6.cloudfront.net/development";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color.fromARGB(98, 107, 106, 106),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 120,
              width: 180,
              child: Card(
                child: Image.network(
                  '$baseImageUrl${widget.data.showroomImages?[0].url}',
                  width: 100,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    Text(
                      widget.data.showroomName ?? "",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      widget.data.location ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.lock_clock_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      widget.data.openTime ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.data.closeTime ?? "",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.car_rental_outlined,
                      color: Colors.white,
                    ),
                    Text(
                      widget.data.carcount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Add more Text widgets with other fields as needed
        ],
      ),
    );
  }
}
