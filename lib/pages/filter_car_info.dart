import 'package:flutter/material.dart';
import 'package:ork_app/custom_filter_container.dart';

class FilterCarInfo extends StatefulWidget {
  const FilterCarInfo({Key? key}) : super(key: key);

  @override
  State<FilterCarInfo> createState() => _FilterCarInfoState();
}

class _FilterCarInfoState extends State<FilterCarInfo> {
  List<String> brands = [
    'Hyundai',
    'Maruti Suzuki',
    'TATA',
    'Mahindra',
    'Toyota',
    'Renault',
    'Honda',
    'Volkswagen',
    'Ford',
    'Mercedes-Benz',
  ];

  List<String> selectedBrands = [];
  bool showSecondContainer = false;

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
            child: Container(
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle visibility of the second container
                        showSecondContainer = !showSecondContainer;
                      });
                    },
                    child: Container(
                      height: double.infinity,
                      width: 170,
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          CustomContainers(
                            text: "Brand",
                            selectedText: selectedBrands.length,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomContainers(
                            text: "Model",
                            selectedText: selectedBrands.length,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomContainers(
                            text: "Price",
                            selectedText: selectedBrands.length,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomContainers(
                            text: "Year",
                            selectedText: selectedBrands.length,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  // Show the second container if showSecondContainer is true
                  if (showSecondContainer)
                    Container(
                      height: double.infinity,
                      width: 230,
                      color: Colors.black,
                      child: ListView.builder(
                        itemCount: brands.length,
                        itemBuilder: (context, index) {
                          return Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                fillColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return null;
                                  }
                                  if (states.contains(MaterialState.selected)) {
                                    return Colors
                                        .blue; // Set the fill color to blue for selected state
                                  }
                                  return null;
                                }),
                                checkColor: MaterialStateProperty.all(Colors
                                    .white), // Set the check color to white
                                overlayColor: MaterialStateProperty.all(
                                    Colors.blue.withOpacity(
                                        0.2)), // Set the overlay color to blue with opacity
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: const BorderSide(
                                        color: Colors
                                            .blue)), // Set the border color to blue
                              ),
                            ),
                            child: CheckboxListTile(
                              onChanged: (value) {
                                setState(() {
                                  if (value!) {
                                    selectedBrands.add(brands[index]);
                                  } else {
                                    selectedBrands.remove(brands[index]);
                                  }
                                });
                              },
                              value: selectedBrands.contains(brands[index]),
                              title: Text(
                                brands[index],
                                style: TextStyle(color: Colors.white),
                              ),
                              controlAffinity: ListTileControlAffinity.leading,
                            ),
                          );
                        },
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
                onTap: () {},
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
                onTap: () {},
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
