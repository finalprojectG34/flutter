import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/models/item_search_filter.dart';

import '../../../helper/constance.dart';

class Filter extends StatefulWidget {
  final ItemSearchFilter itemSearchFilter;
  final Function(ItemSearchFilter itemSearchFilter) onFilter;
  const Filter(
      {Key? key, required this.itemSearchFilter, required this.onFilter})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FilterState();
  }
}

class FilterState extends State<Filter> {
  late double min;
  late double max;
  late TextEditingController minCtrl;
  late TextEditingController maxCtrl;
  List<String> conditions = [];

  @override
  initState() {
    super.initState();
    min = widget.itemSearchFilter.minPrice;
    max = widget.itemSearchFilter.maxPrice;
    minCtrl = TextEditingController(text: min.toStringAsFixed(1));
    maxCtrl = TextEditingController(text: max.toStringAsFixed(1));
    conditions = widget.itemSearchFilter.attributes
            ?.firstWhere((element) => element.name == "condition")
            .values ??
        [];
  }

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
                controller: minCtrl,
                enabled: false,
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
                controller: maxCtrl,
                enabled: false,
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
            values: RangeValues(min, max),
            onChanged: (values) {
              setState(() {
                min = values.start;
                max = values.end;
                minCtrl.text = min.toStringAsFixed(1);
                maxCtrl.text = max.toStringAsFixed(1);
              });
            },
            min: 0,
            max: 10000,
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
            CustomChip(
                isSelected: conditions.contains("New"),
                label: "New",
                onSelected: (value) {
                  print("onSelected");
                  print(value);
                  setState(() {
                    if (!conditions.contains("New")) {
                      conditions.add("New");
                    } else {
                      conditions.remove("New");
                    }
                  });
                }),
            CustomChip(
                isSelected: conditions.contains("Used"),
                label: "Used",
                onSelected: (value) {
                  setState(() {
                    if (!conditions.contains("Used")) {
                      conditions.add("Used");
                    } else {
                      conditions.remove("Used");
                    }
                  });
                }),
            CustomChip(
                isSelected: conditions.contains("Not Specified"),
                label: "Not Specified",
                onSelected: (value) {
                  setState(() {
                    if (!conditions.contains("Not Specified")) {
                      conditions.add("Not Specified");
                    } else {
                      conditions.remove("Not Specified");
                    }
                  });
                }),
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
              var itemFilter = ItemSearchFilter(
                  searchTerm: widget.itemSearchFilter.searchTerm,
                  attributes: [
                    FilterAttributes(name: "condition", values: conditions)
                  ],
                  maxPrice: max,
                  minPrice: min,
                  reqPagInfo: widget.itemSearchFilter.reqPagInfo);
              widget.onFilter(itemFilter);
            },
            child: const Text(
              "Filter",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
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
