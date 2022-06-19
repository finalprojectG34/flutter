import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/profile_page/profile_page_ctx.dart';

class AddressInput extends StatefulWidget {
  const AddressInput(
      {Key? key,
      required this.city,
      required this.subCity,
      required this.country,
      required this.streetName})
      : super(key: key);
  final String city;
  final String subCity;
  final String country;
  final String streetName;

  @override
  State<AddressInput> createState() => _AddressInputState();
}

class _AddressInputState extends State<AddressInput> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController subCityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  FocusNode address1FocusNode = FocusNode();
  String city = '';
  String subCity = '';
  String country = '';
  String streetName = '';
  ProfilePageController profilePageController = Get.find();

  @override
  void initState() {
    super.initState();

    address1FocusNode.addListener(onAddress1FocusChange);
    cityController.text = widget.city;
    subCityController.text = widget.subCity;
    countryController.text = widget.country;
    streetAddressController.text = widget.streetName;
  }

  void onAddress1FocusChange() {
    if (!address1FocusNode.hasFocus) {
      setState(() {
        cityController.text = city;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // address1Controller.text = address1;
    cityController.value.copyWith(text: widget.city);
    subCityController.value.copyWith(text: widget.subCity);
    countryController.value.copyWith(text: widget.country);
    streetAddressController.value.copyWith(text: widget.streetName);
    // address2Controller.text = widget.address2;

    return WillPopScope(
      onWillPop: () async {
        EasyLoading.dismiss();
        return true;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          const Text(
            'Enter the country you live in',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            // readOnly: true,
            keyboardType: TextInputType.text,
            controller: countryController,
            // focusNode: address1FocusNode,
            decoration: const InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blue, width: 0.5),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.75),
              ),
              labelText: 'Country of living',
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            ),
            onChanged: (value) {
              country = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter the city you live in',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: cityController,
            decoration: const InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green, width: 0.5),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.75),
              ),
              labelText: 'City of living',
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            ),
            onChanged: (value) {
              city = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter the sub city you live in',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: subCityController,
            decoration: const InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green, width: 0.5),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.75),
              ),
              labelText: 'Sub-City of living',
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            ),
            onChanged: (value) {
              subCity = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter the street name you live around',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.text,
            controller: streetAddressController,
            decoration: const InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.green, width: 0.5),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 0.75),
              ),
              labelText: 'Street name',
              labelStyle: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
              contentPadding: EdgeInsets.only(left: 20, bottom: 20),
            ),
            onChanged: (value) {
              streetName = value;
            },
            onEditingComplete: () {
              FocusScope.of(context).unfocus();
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateProperty.all(Colors.lightBlueAccent),
              elevation: MaterialStateProperty.all(6),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xff40BFFF)),
              fixedSize: MaterialStateProperty.all(Size(Get.width, 54)),
            ),
            onPressed: () async {
              FocusScope.of(context).unfocus();

              await profilePageController.updateUserAddress(
                Address(
                  subCity: subCityController.text,
                  country: countryController.text,
                  addressName: streetAddressController.text,
                  city: cityController.text,
                ),
              );
              Get.back();
            },
            child: Text(
              '${widget.city == '' ? 'Add' : 'Update'}  location',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
