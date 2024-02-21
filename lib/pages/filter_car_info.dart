import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ork_app/Api/api_file.dart';
import 'package:ork_app/models/filter_model.dart';
import 'package:ork_app/models/brand_name_model.dart';
import 'package:ork_app/models/car_color_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterCarInfo extends StatefulWidget {
  const FilterCarInfo({Key? key}) : super(key: key);

  @override
  State<FilterCarInfo> createState() => _FilterCarInfoState();
}

class _FilterCarInfoState extends State<FilterCarInfo> {
  late List<FilterModel> yearDataList;
  late List<FilterModel> kmDrivenDataList;
  late List<FilterModel> selectedOptions;
  late Map<String, int> categoryCounts;
  late String selectedCategory;
  late List<CarColor> carColor;
  late List<Brandname> brandName;
  late List<bool> selectedColorStates;
  late List<bool> selectedbrandStates;

  @override
  void initState() {
    super.initState();
    yearDataList = [
      FilterModel(title: "0 to 1 Year"),
      FilterModel(title: "1 to 3 Year"),
      FilterModel(title: "3 to 5 Year"),
      FilterModel(title: "5 to 7 Year"),
      FilterModel(title: "7+ Year"),
    ];

    kmDrivenDataList = [
      FilterModel(title: "Below 25000km"),
      FilterModel(title: "25000 to 50000Km"),
      FilterModel(title: "50000 to 75000Km"),
      FilterModel(title: "75000 to 100000Km"),
      FilterModel(title: "Above 100000Km+"),
    ];

    selectedOptions = [];
    categoryCounts = {
      'Year': 0,
      'Km Driven': 0,
      'color': 0,
      'brandname': 0,
    };
    selectedCategory = '';
    carColor = [];
    brandName = [];
    selectedColorStates = [];
    selectedbrandStates = [];
    _fetchCarColor();
    _fetchBrandName();
  }

  static Future<String> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access_token") ?? "";
  }

// Send filter request to server
  void postFilterRequest(String token) async {
    // Print the token before sending the request
    print('Access Token: $token');

    // Create Dio instance
    Dio dio = Dio();

    // Define the API endpoint URL
    String url = 'https://dev-api.orkindia.com/api/v1/users/filter-search';

    // Construct the request body
    Map<String, dynamic> requestBody = {
      'page': '1',
      'type': 'showroom',
      'year': yearDataList
          .where((option) => option.isSelected)
          .map((option) => option.title)
          .toList(),
      'kmDriven': kmDrivenDataList
          .where((option) => option.isSelected)
          .map((option) => option.title)
          .toList(),
      'colors': carColor
          .asMap()
          .entries
          .where((entry) => selectedColorStates[entry.key])
          .map((entry) => entry.value.color)
          .toList(),
      'brands': brandName
          .asMap()
          .entries
          .where((entry) => selectedbrandStates[entry.key])
          .map((entry) => entry.value.brandName)
          .toList(),
    };

    try {
      dio.options.headers['Authorization'] = 'Bearer $token';
      print('Access Token: $token');
      // Send POST request with token in header
      Response response = await dio.post(
        url,
        data: requestBody,
      );

      // Handle response
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');
    } on DioError catch (e) {
      // Handle Dio errors
      if (e.response?.statusCode == 401) {
        print(
            'Unauthorized: You need to authenticate before accessing this resource.');
      } else {
        print('Error: $e');
      }
    } catch (e) {
      // Handle other errors
      print('Error: $e');
    }
  }

  Future<void> _fetchCarColor() async {
    try {
      List<CarColor> profiles = await ApiHelper.fetchCarColor();
      setState(() {
        carColor = profiles;
        selectedColorStates = List.generate(carColor.length, (_) => false);
      });
    } catch (e) {
      print('Error fetching car colors: $e');
    }
  }

  Future<void> _fetchBrandName() async {
    try {
      List<Brandname> profiles = await ApiHelper.fetchBrandName();
      setState(() {
        brandName = profiles;
        selectedbrandStates = List.generate(brandName.length, (_) => false);
      });
    } catch (e) {
      print('Error fetching brand names: $e');
    }
  }

  // Get access token from SharedPreferences

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 60, 59, 59),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filter', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var category in [
                    'Year',
                    'Km Driven',
                    'color',
                    'brandname'
                  ])
                    SizedBox(
                      height: 50,
                      child: buildFilterButton(category),
                    ),
                ],
              ),
            ),
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
              onPressed: clearAllSelections,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Clear All',
                  style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () async {
                String accessToken = await _getAccessToken();
                postFilterRequest(accessToken);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: const Text('Apply', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilterButton(String category) {
    int count = categoryCounts[category] ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 6.0),
      child: SizedBox(
        width: 200,
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
            backgroundColor: const Color.fromARGB(255, 48, 48, 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.white),
              ),
              if (count > 0)
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${categoryCounts[category]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildCheckboxList() {
    List<Widget> checkboxes = [];

    checkboxes.addAll(selectedOptions.map((option) {
      return CheckboxListTile(
        title: Text(
          option.title,
          style: const TextStyle(color: Colors.white),
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
    }));

    if (selectedCategory == 'color') {
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
              updateCounts();
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.blue,
          checkColor: Colors.white,
        );
      }));
    }

    if (selectedCategory == 'brandname') {
      checkboxes.addAll(brandName.asMap().entries.map((entry) {
        int index = entry.key;
        Brandname brandname = entry.value;
        return CheckboxListTile(
          title: Text(
            brandname.brandName ?? '',
            style: const TextStyle(color: Colors.white),
          ),
          value: selectedbrandStates.length > index
              ? selectedbrandStates[index]
              : false,
          onChanged: (value) {
            setState(() {
              selectedbrandStates[index] = value!;
              updateCounts();
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.blue,
          checkColor: Colors.white,
        );
      }));
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
