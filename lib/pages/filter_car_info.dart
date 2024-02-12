import 'package:flutter/material.dart';
import 'package:ork_app/Api/api_file.dart';
import 'package:ork_app/filter_model.dart';
import 'package:ork_app/models/brand_name_model.dart';
import 'package:ork_app/models/car_color_model.dart';

class FilterCarInfo extends StatefulWidget {
  const FilterCarInfo({Key? key}) : super(key: key);

  @override
  State<FilterCarInfo> createState() => _FilterCarInfoState();
}

class _FilterCarInfoState extends State<FilterCarInfo> {
  List<FilterModel> yearDataList = [
    FilterModel(title: "0 to 1 Year"),
    FilterModel(title: "1 to 3 Year"),
    FilterModel(title: "3 to 5 Year"),
    FilterModel(title: "5 to 7 Year"),
    FilterModel(title: "7+ Year"),
  ];

  List<FilterModel> kmDrivenDataList = [
    FilterModel(title: "Below 25000km"),
    FilterModel(title: "25000 to 50000Km"),
    FilterModel(title: "50000 to 75000Km"),
    FilterModel(title: "75000 to 100000Km"),
    FilterModel(title: "Above 100000Km+"),
  ];

  List<FilterModel> selectedOptions = [];
  Map<String, int> categoryCounts = {
    'Year': 0,
    'Km Driven': 0,
    'color': 0,
    'brandname': 0,
  };
  String selectedCategory = '';
  late List<CarColor> carColor = [];

  late List<Brandname> brandName = [];

  @override
  void initState() {
    super.initState();
    _fetchCarColor();
    _fetchBrandName();
  }

  Future<void> _fetchCarColor() async {
    try {
      // Change the type of profiles to List<CarColor>
      List<CarColor> profiles = await ApiHelper.fetchCarColor();
      setState(() {
        // Assign profiles to carColor
        carColor = profiles;
        // Initialize selectedColorStates based on carColor length
        selectedColorStates = List.generate(carColor.length, (_) => false);
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
    }
  }

  Future<void> _fetchBrandName() async {
    try {
      // Change the type of profiles to List<CarColor>
      List<Brandname> profiles = await ApiHelper.fetchBrandName();
      setState(() {
        // Assign profiles to carColor
        brandName = profiles;
        // Initialize selectedColorStates based on carColor length
        selectedbrandStates = List.generate(brandName.length, (_) => false);
      });
    } catch (e) {
      print('Error fetching car profiles: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 59, 59),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Filter', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First column for filter options
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50, // Fixed height for the buttons
                    child: buildFilterButton('Year'),
                  ),
                  SizedBox(
                    height: 50, // Fixed height for the buttons
                    child: buildFilterButton('Km Driven'),
                  ),
                  SizedBox(
                    height: 50, // Fixed height for the buttons
                    child: buildFilterButton('color'),
                  ),
                  SizedBox(
                    height: 50, // Fixed height for the buttons
                    child: buildFilterButton('brandname'),
                  ),
                ],
              ),
            ),
            // Second column for selected filter options
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: buildCheckboxList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 60, 59, 59),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  clearAllSelections();
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text(
                'Clear All',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to FilterOptionsPage and pass the selected options
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => FilterOptionsPage(selectedOptions: selectedOptions),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(
                'Apply',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterButton(String category) {
    int count = categoryCounts[category] ?? 0;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 3.0, horizontal: 6.0), // Adjust padding as needed
      child: Container(
        width: 200, // Set a fixed width for consistent button lengths
        child: TextButton(
          onPressed: () {
            setState(() {
              if (selectedCategory == category) {
                selectedCategory = '';
              } else {
                selectedOptions = category == 'Year'
                    ? yearDataList
                    : category == 'Km Driven'
                        ? kmDrivenDataList
                        : [];
                selectedCategory = category;
              }
              updateCounts();
            });
          },
          style: TextButton.styleFrom(
            backgroundColor:
                Color.fromARGB(255, 48, 48, 48), // Set gray background color
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style:
                    TextStyle(color: Colors.white), // Set text color to black
              ),
              if (count > 0)
                Container(
                  width: 24, // Set the width of the container
                  height: 24, // Set the height of the container
                  alignment: Alignment.center, // Center the count
                  decoration: BoxDecoration(
                    color: Colors
                        .blue, // Set the background color of the container
                    borderRadius: BorderRadius.circular(
                        4), // Apply border radius for a rounded appearance
                  ),
                  child: Text(
                    '${categoryCounts[category]}',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<bool> selectedColorStates = [];
  List<bool> selectedbrandStates = [];

  List<Widget> buildCheckboxList() {
    List<Widget> checkboxes = [];
    checkboxes.addAll(selectedOptions.map((option) {
      return CheckboxListTile(
        title: Text(
          option.title,
          style: TextStyle(color: Colors.white),
        ),
        value: option.isSelected,
        onChanged: (value) {
          setState(() {
            option.isSelected = value!;
            updateCounts();
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.blue,
        checkColor: Colors.white,
      );
    }).toList());

    // Check if the "Color" button is selected
    if (selectedCategory == 'color') {
      // Add color checkboxes
      checkboxes.addAll(carColor.map((color) {
        int index = carColor.indexOf(color);
        return CheckboxListTile(
          title: Text(
            color.color ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          value: selectedColorStates.length > index
              ? selectedColorStates[index]
              : false,
          onChanged: (value) {
            setState(() {
              selectedColorStates[index] = value!;
              updateCounts(); // Update counts when checkbox state changes
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.blue,
          checkColor: Colors.white,
        );
      }).toList());
    }

    if (selectedCategory == 'brandname') {
      // Add brand name checkboxes
      checkboxes.addAll(brandName.map((brandname) {
        int index = brandName.indexOf(brandname);
        return CheckboxListTile(
          title: Text(
            brandname.brandName ??
                '', // Access the color property of the Doc object
            style: const TextStyle(color: Colors.white),
          ),
          value: selectedbrandStates.length > index
              ? selectedbrandStates[index]
              : false,
          onChanged: (value) {
            setState(() {
              selectedbrandStates[index] = value!;
              updateCounts(); // Update counts when checkbox state changes
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.blue,
          checkColor: Colors.white,
        );
      }).toList());
    }

    return checkboxes;
  }

  void updateCounts() {
    categoryCounts['Year'] =
        yearDataList.where((option) => option.isSelected).length;
    categoryCounts['Km Driven'] =
        kmDrivenDataList.where((option) => option.isSelected).length;
    categoryCounts['color'] =
        selectedColorStates.where((isSelected) => isSelected).length;
    categoryCounts['brandname'] =
        selectedbrandStates.where((isSelected) => isSelected).length;
  }

  void clearAllSelections() {
    setState(() {
      for (var option in yearDataList) {
        option.isSelected = false;
      }
      for (var option in kmDrivenDataList) {
        option.isSelected = false;
      }

      selectedColorStates = List.generate(carColor.length, (_) => false);
      selectedbrandStates = List.generate(brandName.length, (_) => false);

      updateCounts();
    });
  }
}
