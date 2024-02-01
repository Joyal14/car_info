import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ork_app/car_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {
  static const String baseUrl = 'https://api.orkindia.com/api/v1/users';

  static Dio createDio() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }

  static Future<void> fetchCarProfiles() async {
    Dio dio = createDio();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String accessToken = prefs.getString("access_token") ?? "";
      dio.options.headers['Authorization'] = accessToken;

      Response response = await dio.get(
        '$baseUrl/getCarProfiles',
        queryParameters: {
          'latitude': "13.3450369",
          'longitude': "74.7512283",
          'sort': "1",
          'page': '1',
          'search': '',
        },
      );
      print(response);
    } catch (e) {
      print('Error: $e');
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ApiHelper.fetchCarProfiles();
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Replace with your actual item count
                  itemBuilder: (context, index) {
                    return buildCarCard(); // You can pass your data here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
