import 'package:flutter/material.dart';
import 'package:ork_app/custom_container.dart';
import 'package:ork_app/custom_textfield.dart';
import 'package:ork_app/models/vechile_model.dart';

class CarDetailsPage extends StatefulWidget {
  final VechileListModel carDetails;

  const CarDetailsPage({Key? key, required this.carDetails}) : super(key: key);

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Car Details',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Udupi',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "image/car.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.carDetails.brandData?.brandName ?? 'Brand Name'} ${widget.carDetails.modelData?.modelName ?? ''}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Udupi',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                '₹ ${widget.carDetails.price ?? 'Price'}',
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomContainer(
                    labelText: 'Km Driven',
                    valueText: '${widget.carDetails.kmDriven}',
                    imagePath: 'image/speed.png',
                    containerWidth: 90,
                  ),
                  CustomContainer(
                    labelText: 'Year',
                    valueText: '${widget.carDetails.yearData?.year}',
                    imagePath: 'image/cal.png',
                    containerWidth: 90,
                  ),
                  CustomContainer(
                    labelText: 'Fuel Type',
                    valueText: '${widget.carDetails.fuelTypeData?.fuelType}',
                    imagePath: 'image/fuel.png',
                    containerWidth: 90,
                  ),
                  CustomContainer(
                    labelText: 'Owner',
                    valueText:
                        '${widget.carDetails.numberOfOwnerData?.numberOfOwner}',
                    imagePath: 'image/user.png',
                    containerWidth: 90,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(136, 91, 90, 90),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Specifications',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      const Divider(
                        color: Color.fromARGB(136, 91, 90, 90),
                      ),
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buildSpecificationRow('Car Brand',
                              widget.carDetails.brandData?.brandName),
                          buildSpecificationRow(
                              'Model',
                              widget.carDetails.modelData?.modelName ??
                                  'Model Name'),
                          buildSpecificationRow(
                              'Price', widget.carDetails.price?.toString()),
                          buildSpecificationRow('Year',
                              widget.carDetails.yearData?.year?.toString()),
                          buildSpecificationRow('Km Driven',
                              widget.carDetails.kmDriven?.toString()),
                          buildSpecificationRow('Fuel Type',
                              widget.carDetails.fuelTypeData?.fuelType),
                          buildSpecificationRow(
                              'Transmission',
                              widget.carDetails.transmissionData
                                  ?.transmissionType),
                          buildInfoRow(
                              'No. of Owners',
                              widget.carDetails.numberOfOwnerData?.numberOfOwner
                                  ?.toString()),
                          buildInfoRow('Registration No.',
                              widget.carDetails.registrationNumber?.toString()),
                          buildSpecificationRow(
                              'Color', widget.carDetails.colorData?.color),
                          buildSpecificationRow('Insurance',
                              widget.carDetails.insuranceData?.insuranceType),
                          buildInfoRow(
                              'Mileage', widget.carDetails.mileage?.toString()),
                          buildInfoRow('Seats',
                              widget.carDetails.seatsData?.seats?.toString()),
                          buildInfoRow('Body Type',
                              widget.carDetails.bodytypeData?.bodyType),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(136, 91, 90, 90),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                      Divider(
                        color: Color.fromARGB(136, 91, 90, 90),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(136, 91, 90, 90),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
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
                          "View Dealer Details",
                          style: TextStyle(color: Colors.blue),
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
                            "Contact Dealer",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildInfoRow(String labelText, String? valueText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CustomText(text: labelText),
      const SizedBox(width: 10),
      const CustomText(text: ':'),
      Expanded(
        child: CustomText(text: valueText ?? ''),
      ),
    ],
  );
}

Widget buildSpecificationRow(String labelText, String? valueText) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CustomText(text: labelText),
      const SizedBox(width: 10),
      const CustomText(text: ':'),
      Expanded(
        child: CustomText(text: valueText ?? ''),
      ),
    ],
  );
}
