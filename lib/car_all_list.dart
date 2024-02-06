import 'package:flutter/material.dart';
import 'package:ork_app/Api/api_file.dart';
import 'package:ork_app/car_card.dart';
import 'package:ork_app/models/vechile_model.dart';
import 'package:ork_app/pages/car_details_page.dart';

class CarAllList extends StatefulWidget {
  const CarAllList({super.key});

  @override
  State<CarAllList> createState() => _CarAllListState();
}

class _CarAllListState extends State<CarAllList> {
  late List<VechileListModel> carProfiles = [];
  late List<VechileListModel> filteredCarProfiles = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _fetchCarProfiles();
  }

  Future<void> _fetchCarProfiles() async {
    try {
      List<VechileListModel> profiles = await ApiHelper.fetchCarProfiles();
      setState(() {
        carProfiles = profiles;
        filteredCarProfiles = profiles;
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
    }
  }

  void _filterCarProfiles(String query) {
    setState(() {
      filteredCarProfiles = carProfiles
          .where((profile) =>
              profile.brandData?.brandName
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Car List',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) => _filterCarProfiles(query),
              decoration: InputDecoration(
                hintText: 'Search cars...',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' Result(s): ${filteredCarProfiles.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const Text(
                  "View All",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SizedBox(
                child: filteredCarProfiles.isEmpty
                    ? const Center(
                        child: Text('No matching car profiles.'),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing:
                              1.0, // You can adjust the spacing as needed
                          mainAxisSpacing:
                              9.0, // You can adjust the spacing as needed
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: filteredCarProfiles.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CarDetailsPage(
                                    carDetails: filteredCarProfiles[index],
                                  ),
                                ),
                              );
                            },
                            child: CarCard(data: filteredCarProfiles[index]),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
