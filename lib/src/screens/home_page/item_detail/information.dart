import 'package:flutter/material.dart';

class RowElement extends StatelessWidget {
  final String? description;
  final String? status;
  final Color? descriptionColor;
  final Color? statusColor;

  const RowElement({
    Key? key,
    this.description,
    this.status,
    this.descriptionColor,
    this.statusColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          description!,
          style: TextStyle(color: descriptionColor),
        ),
        Text(
          status!,
          style: TextStyle(color: statusColor),
        ),
      ],
    );
  }
}
