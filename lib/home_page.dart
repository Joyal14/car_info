import 'package:flutter/material.dart';
import 'package:ork_app/api_file.dart';
import 'package:ork_app/car_card.dart'; // Import your CarCard widget
import 'package:ork_app/models/vechile_model.dart';
import 'package:ork_app/showroom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Doc> carProfiles = [];
  late List<Doc> showRoom = [];

  @override
  void initState() {
    super.initState();
    _fetchCarProfiles();
    _fetchShowRoom();
  }

  Future<void> _fetchCarProfiles() async {
    try {
      List<Doc> profiles = await ApiHelper.fetchCarProfiles();
      setState(() {
        carProfiles = profiles;
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
      // Handle the error if needed
    }
  }

  Future<void> _fetchShowRoom() async {
    try {
      List<Doc> profiles = await ApiHelper.fetchShowRoom();
      setState(() {
        showRoom = profiles;
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
      // Handle the error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Image.asset("image/ork.png"),
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "image/Black.png",
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Udupi",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: const [
          Icon(
            Icons.filter,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.search_outlined,
            color: Colors.white,
            size: 35,
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('image/head.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ORK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            color: Colors.blue,
                          ),
                          Text(
                            "PRE-OWNED VEHICLES!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "WHEELS FOR EVERY HOME",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Choose your Car & Book an Appointment with Dealer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 6,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    bottom: 10,
                    child: Image.asset(
                      'image/Frame.png',
                      width: 180,
                      height: 40, // Set your desired width
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recently added Cars",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 210,
                width: double.infinity,
                child: carProfiles.isEmpty
                    ? const Center(
                        child: Text('No car profiles available.'),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: carProfiles.length,
                        itemBuilder: (context, index) {
                          return CarCard(data: carProfiles[index]);
                        },
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Top Showrooms",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 260,
                width: double.infinity,
                child: showRoom.isEmpty
                    ? const Center(
                        child: Text('No ShowRoom profiles available.'),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: showRoom.length,
                        itemBuilder: (context, index) {
                          return ShowRoomCard(data: showRoom[index]);
                        },
                      ),
              ),
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color.fromARGB(98, 107, 106, 106),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.sell,
                      color: Colors.white,
                    ),
                    label: 'Sell Car',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                    label: 'Notification',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: 'Profile',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
