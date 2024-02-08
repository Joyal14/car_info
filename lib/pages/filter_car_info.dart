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
      body: Row(
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
                  CustomContainers(
                    text: "Km Driver",
                    selectedText: selectedBrands.length,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainers(
                    text: "Fuel type",
                    selectedText: selectedBrands.length,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomContainers(
                    text: "Km Driver",
                    selectedText: selectedBrands.length,
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
              color: Colors.white,
              child: ListView.builder(
                itemCount: brands.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(brands[index]),
                    value: selectedBrands.contains(brands[index]),
                    onChanged: (value) {
                      setState(() {
                        if (value!) {
                          selectedBrands.add(brands[index]);
                        } else {
                          selectedBrands.remove(brands[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
