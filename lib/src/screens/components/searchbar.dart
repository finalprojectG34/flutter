import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: Card(
        child: Row(
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  // style: TextStyle(fontSize: 13),
                  maxLines: 1,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.green[200]),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
