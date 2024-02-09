// import 'package:flutter/material.dart';
// import 'package:ork_app/Api/api_file.dart';
// import 'package:ork_app/custom_filter_container.dart';
// import 'package:ork_app/models/car_color_model.dart';

// class FilterCarInfo extends StatefulWidget {
//   const FilterCarInfo({Key? key}) : super(key: key);

//   @override
//   State<FilterCarInfo> createState() => _FilterCarInfoState();
// }

// class _FilterCarInfoState extends State<FilterCarInfo> {
//   List<String> yearDataList = [
//     '0 to 1 years',
//     '1 to 3 years',
//     '3 to 5 years',
//     '5 to 7 years',
//     '7+ years',
//   ];

//   List<String> selectedYears = [];
//   late List<CarColorModel> carColor = [];
//   bool showSecondContainer = false;

//   @override
//   void setState(VoidCallback fn) {
//     // TODO: implement setState
//     super.setState(fn);
//     _fetchCarColor();
//   }

//   Future<void> _fetchCarColor() async {
//     try {
//       List<CarColorModel> profiles = await ApiHelper.fetchCarColor();
//       setState(() {
//         carColor = profiles;
//       });
//       print(carColor);
//     } catch (e) {
//       print('Error fetching car profiles: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text(
//           'Filter By',
//           style: TextStyle(color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         children: [
//           Expanded(
//             child: SizedBox(
//               width: double.infinity,
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         // Toggle visibility of the second container
//                         showSecondContainer = !showSecondContainer;
//                       });
//                     },
//                     child: Container(
//                       height: double.infinity,
//                       width: 170,
//                       color: Colors.black,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           // CustomContainers(
//                           //   text: "Brand",
//                           //   selectedText: carColor,
//                           // ),
//                           // const SizedBox(
//                           //   height: 5,
//                           // ),
//                           // CustomContainers(
//                           //   text: "Model",
//                           //   selectedText: selectedBrands.length,
//                           // ),
//                           // const SizedBox(
//                           //   height: 5,
//                           // ),
//                           // CustomContainers(
//                           //   text: "Price",
//                           //   selectedText: selectedBrands.length,
//                           // ),
//                           // const SizedBox(
//                           //   height: 5,
//                           // ),
//                           CustomContainers(
//                             text: "Year",
//                             selectedText: selectedYears.length,
//                           ),
//                           // const SizedBox(
//                           //   height: 5,
//                           // ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   // Show the second container if showSecondContainer is true
//                   if (showSecondContainer)
//                     Container(
//                       height: double.infinity,
//                       width: 230,
//                       color: Colors.black,
//                       child: ListView.builder(
//                         itemCount: yearDataList.length,
//                         itemBuilder: (context, index) {
//                           return Theme(
//                             data: ThemeData(
//                               checkboxTheme: CheckboxThemeData(
//                                 fillColor:
//                                     MaterialStateProperty.resolveWith<Color?>(
//                                         (Set<MaterialState> states) {
//                                   if (states.contains(MaterialState.disabled)) {
//                                     return null;
//                                   }
//                                   if (states.contains(MaterialState.selected)) {
//                                     return Colors
//                                         .blue; // Set the fill color to blue for selected state
//                                   }
//                                   return null;
//                                 }),
//                                 checkColor: MaterialStateProperty.all(Colors
//                                     .white), // Set the check color to white
//                                 overlayColor: MaterialStateProperty.all(
//                                     Colors.blue.withOpacity(
//                                         0.2)), // Set the overlay color to blue with opacity
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(4),
//                                     side: const BorderSide(
//                                         color: Colors
//                                             .blue)), // Set the border color to blue
//                               ),
//                             ),
//                             child: CheckboxListTile(
//                               onChanged: (value) {
//                                 setState(() {
//                                   if (value!) {
//                                     selectedYears.add(yearDataList[index]);
//                                   } else {
//                                     selectedYears.remove(yearDataList[index]);
//                                   }
//                                 });
//                               },
//                               value:
//                                   selectedYears.contains(yearDataList[index]),
//                               title: Text(
//                                 yearDataList[index],
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               controlAffinity: ListTileControlAffinity.leading,
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//           // Buttons at the bottom of the screen
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 150,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: const Color.fromARGB(224, 34, 96, 202),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Clear All",
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   width: 150,
//                   height: 60,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: const Color.fromARGB(224, 34, 96, 202),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Apply",
//                       style: TextStyle(color: Colors.blue),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:ork_app/Api/api_file.dart';
import 'package:ork_app/models/car_color_model.dart';

class FilterCarInfo extends StatefulWidget {
  const FilterCarInfo({Key? key}) : super(key: key);

  @override
  State<FilterCarInfo> createState() => _FilterCarInfoState();
}

class _FilterCarInfoState extends State<FilterCarInfo> {
  late List<CarColorModel> carColor = [];

  @override
  void initState() {
    super.initState();
    _fetchCarColor();
  }

  // Function to fetch car colors from the API
  Future<void> _fetchCarColor() async {
    try {
      List<CarColorModel> profiles = await ApiHelper.fetchCarColor();
      setState(() {
        carColor = profiles;
      });
      print(carColor);
    } catch (e) {
      print('Error fetching car profiles: $e');
    }
  }

  // Function to handle clearing all selected filters
  void _clearAllFilters() {
    setState(() {
      // Clear all selected filters
    });
  }

  // Function to handle applying selected filters
  void _applyFilters() {
    setState(() {
      // Apply selected filters
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Filter By',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle tap
                    },
                    child: Container(
                      height: double.infinity,
                      width: 170,
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          CustomContainers(
                            text: "Color",
                            carColors: carColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Buttons at the bottom of the screen
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: _clearAllFilters, // Call _clearAllFilters function
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(224, 34, 96, 202),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Clear All",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: _applyFilters, // Call _applyFilters function
                child: Container(
                  width: 150,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromARGB(224, 34, 96, 202),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Apply",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomContainers extends StatelessWidget {
  final String text;
  final List<CarColorModel> carColors;

  const CustomContainers({
    Key? key,
    required this.text,
    required this.carColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        if (text == '')
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: carColors.map((carColor) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: carColor.data?.docs
                          ?.map((doc) => CheckboxListTile(
                                onChanged: (value) {
                                  // Handle checkbox onChanged
                                },
                                value: false, // Set initial value
                                title: Text(
                                  doc.color ?? '', // Display color name
                                  style: const TextStyle(color: Colors.white),
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ))
                          .toList() ??
                      []);
            }).toList(),
          ),
      ],
    );
  }
}
