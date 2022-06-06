import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helper/constance.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Price Range",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: color1),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  hintText: "\$1.2",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: color3, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: color3, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.lightBlue, width: 1)),
                ),
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  hintText: "\$2.2",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: color3, width: 1)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(color: color3, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide:
                          const BorderSide(color: Colors.lightBlue, width: 1)),
                ),
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
              ),
            )
          ]),
          const SizedBox(
            height: 20,
          ),
          RangeSlider(
            values: const RangeValues(0, 100),
            onChanged: (values) {},
            min: 0,
            max: 100,
            inactiveColor: color3,
            activeColor: Colors.lightBlue,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "MIN",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: color4),
                  ),
                  Text(
                    "MAX",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: color4),
                  ),
                ],
              )),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Condition",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: color1),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(spacing: 5, runSpacing: 5, children: [
            CustomChip(isSelected: false, label: "New", onSelected: (value) {}),
            CustomChip(isSelected: true, label: "Used", onSelected: (value) {}),
            CustomChip(
                isSelected: true,
                label: "Not Specified",
                onSelected: (value) {}),
          ]),
          const SizedBox(
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
            onPressed: () {
              Get.back();

              // signUpController.signupUser({
              //   "input": {
              //     "firstName": firstName,
              //     "lastName": lastName,
              //     "phone": phoneNumber,
              //     // "password": "my password"
              //   }
              // });

              // ctx.sendFakeOtp();
            },
            child: const Text(
              "Filter",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          // const Text(
          //   "Buying Format",
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold, fontSize: 14, color: color1),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          // Wrap(spacing: 5, runSpacing: 5, children: [
          //   CustomChip(
          //       isSelected: false,
          //       label: "All Listings",
          //       onSelected: (value) {}),
          //   CustomChip(
          //       isSelected: true,
          //       label: "Accept Offers",
          //       onSelected: (value) {}),
          //   CustomChip(
          //       isSelected: false, label: "Auction", onSelected: (value) {}),
          //   CustomChip(
          //       isSelected: false,
          //       label: "Buy it now",
          //       onSelected: (value) {}),
          //   CustomChip(
          //       isSelected: false,
          //       label: "Classified Ads",
          //       onSelected: (value) {})
          // ])
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final Function(bool) onSelected;

  const CustomChip(
      {Key? key,
      required this.isSelected,
      required this.label,
      required this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterChip(
        padding: const EdgeInsets.all(10.0),
        showCheckmark: false,
        label: Text(
          label,
          style: isSelected
              ? const TextStyle(
                  color: color5, fontWeight: FontWeight.bold, fontSize: 12)
              : const TextStyle(
                  color: color4,
                ),
        ),
        onSelected: onSelected,
        shape: const RoundedRectangleBorder(side: BorderSide(color: color3)),
        selectedColor: color5.withOpacity(0.1),
        selected: false,
        backgroundColor: Colors.white);
  }
}
