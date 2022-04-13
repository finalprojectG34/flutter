import 'package:flutter/material.dart';

class UserInputController extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureElement;
  final Function onElementTap;
  const UserInputController({
    Key key, this.hintText, this.icon, this.obscureElement, this.onElementTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextField(
        obscureText: obscureElement == null ? false : obscureElement,
        onTap: onElementTap,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: Icon(
            icon,
            size: 28.0,
          ),
        ),
      ),
    );
  }
}
