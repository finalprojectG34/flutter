import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sms/src/screens/components/category_list.dart';
import 'package:sms/src/screens/components/suggested_items.dart';
import '../components/item_mini_detail.dart';
import '../components/profile_mini_detail.dart';
import '../components/searchbar.dart';
import 'AppCtx.dart';

class Home extends StatefulWidget {
  final bool hasSearchBar;

  const Home({Key? key, required this.hasSearchBar}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.hasSearchBar) const SearchBar(),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              const SuggestedItems(),
              const SizedBox(
                height: 15.0,
              ),
              const CategoryList(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Flash Sale',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
              GridView.count(
                childAspectRatio: .5,
                crossAxisCount: 2,
                children: const [
                  ItemMiniDetail(),
                  ItemMiniDetail(),
                ],
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Visit shops',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black)),
                    TextButton(onPressed: () {}, child: const Text('See all'))
                  ],
                ),
              ),
              GridView.count(
                childAspectRatio: 1.1,
                crossAxisCount: 2,
                children: const [
                  ProfileMiniDetail(),
                  ProfileMiniDetail(),
                ],
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 3,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Latest products',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black)),
                    TextButton(onPressed: () {}, child: const Text('See all'))
                  ],
                ),
              ),
              GridView.count(
                childAspectRatio: .5,
                crossAxisCount: 2,
                children: const [
                  ItemMiniDetail(),
                  ItemMiniDetail(),
                  ItemMiniDetail(),
                  ItemMiniDetail(),
                ],
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
