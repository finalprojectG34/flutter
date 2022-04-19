import 'package:flutter/material.dart';

class AppBarComponent {
  static AppBar setAppBar(String name) {
    return AppBar(
      title: Text(name),
      elevation: 2,
      centerTitle: true,
      actions: [
        // if (!searchBar)
        IconButton(
          onPressed: () {
            // setState(() {
            //   searchBar = true;
            // });
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
    );
  }
}
