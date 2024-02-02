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
      height: 150,
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
              height: 180,
              width: 100,
              child: Image.network(
                '$baseImageUrl${widget.data.showroomImages?[0].url}',
                width: 100,
                height: 100,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                'Showroom Name: ${widget.data.showroomName ?? ""}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Owner Name: ${widget.data.ownerName ?? ""}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Location: ${widget.data.location ?? ""}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),

          // Add more Text widgets with other fields as needed
        ],
      ),
    );
  }
}
