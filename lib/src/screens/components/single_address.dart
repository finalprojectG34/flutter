import 'package:flutter/material.dart';

import 'address_input.dart';

class SingleAddress extends StatelessWidget {
  final String country;
  final String city;
  final String subCity;
  final String streetName;

  // AddressController addressController = Get.find();
  SingleAddress(
      {Key? key,
      required this.country,
      required this.city,
      required this.streetName,
      required this.subCity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!, width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Country: '),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      country,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('City: '),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      city,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Sub city: '),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      subCity,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Street name: '),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      streetName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue[500]),
                onPressed: () {
                  showModalBottomSheet(
                    isDismissible: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    context: context,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: AddressInput(
                            city: city,
                            subCity: subCity,
                            country: country,
                            streetName: streetName,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
