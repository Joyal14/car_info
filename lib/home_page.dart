import 'package:flutter/material.dart';
import 'package:ork_app/Api/api_file.dart';
import 'package:ork_app/car_card.dart'; // Import your CarCard widget
import 'package:ork_app/car_details_page.dart';
import 'package:ork_app/car_all_list.dart';
import 'package:ork_app/models/showroom_model.dart';
import 'package:ork_app/models/vechile_model.dart';
import 'package:ork_app/showroom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<VechileListModel> carProfiles = [];
  late List<ShowRoomModel> showRoom = [];

  @override
  void initState() {
    super.initState();
    _fetchCarProfiles();
    _fetchShowRoom();
  }

  Future<void> _fetchCarProfiles() async {
    try {
      List<VechileListModel> profiles = await ApiHelper.fetchCarProfiles();
      setState(() {
        carProfiles = profiles;
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
    }
  }

  Future<void> _fetchShowRoom() async {
    try {
      List<ShowRoomModel> profiles = await ApiHelper.fetchShowRoom();
      setState(() {
        showRoom = profiles;
      });
    } catch (e) {
      print('Error fetching showroom profiles: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: screenHeight * 0.15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('image/head.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "ORK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            color: Colors.blue,
                          ),
                          const Text(
                            "PRE-OWNED VEHICLES!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "WHEELS FOR EVERY HOME",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: screenHeight * 0.033,
                          ),
                          Text(
                            "Choose your Car & Book an Appointment with Dealer",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.015,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.04,
                    right: screenWidth * 0.02,
                    bottom: screenHeight * 0.02,
                    child: Image.asset(
                      'image/Frame.png',
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.04, // Set your desired width
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recently added Cars",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: screenWidth * 0.3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CarAllList(),
                        ),
                      );
                    },
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: screenHeight * 0.25,
                width: double.infinity,
                child: carProfiles.isEmpty
                    ? const Center(
                        child: Text('No car profiles available.'),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: carProfiles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsPage(
                                    carDetails: carProfiles[index],
                                  ),
                                ),
                              );
                            },
                            child: CarCard(data: carProfiles[index]),
                          );
                        },
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Top Showrooms",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: screenWidth * 0.4,
                  ),
                  const Text(
                    "View All",
                    style: TextStyle(color: Colors.blue, fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: screenHeight * 0.3,
                width: double.infinity,
                child: showRoom.isEmpty
                    ? const Center(
                        child: Text(
                          'No ShowRoom profiles available.',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: showRoom.length,
                        itemBuilder: (context, index) {
                          return ShowRoomCard(data: showRoom[index]);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
