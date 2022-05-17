import 'package:flutter/material.dart';

class ItemDetailInfo extends StatelessWidget {
  final String? itemProperty;
  final String? itemDescription;
  final bool? isSold;
  final String? soldItemNumber;
  final bool? isButton;
  final IconData? icon;

  const ItemDetailInfo({
    Key? key,
    this.itemProperty,
    this.itemDescription,
    this.soldItemNumber,
    this.isSold,
    this.isButton,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemProperty!,
          style: TextStyle(color: Colors.grey),
        ),
        isSold == false
            ? Text(itemDescription!)
            : Column(
                children: [
                  Text(
                    soldItemNumber!,
                    style: TextStyle(color: Colors.red),
                  ),
                  Text(itemDescription!)
                ],
              ),
        isButton!
            ? IconButton(icon: Icon(icon), onPressed: () {})
            : Container(),
      ],
    );
  }
}
