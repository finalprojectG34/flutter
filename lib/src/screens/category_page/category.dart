import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:shopping/src/models/item.dart';
import 'package:sms/src/models/item.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';

import '../../app.dart';



part 'category_components.dart';

class CategoriesPage extends StatelessWidget {
  static const String pathName = '/categories';

  const CategoriesPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        categoryTitle,
        categoryButton,
        //================ categories container
        Container(
          height: MediaQuery.of(context).size.height * 0.26,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            itemCount: 8,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
            itemBuilder: (BuildContext context, int index) {
              return SingleCategoryItem();
            },
          ),
        ),
        //----just name
        allCategory,

        //========================= Horizontal items
        Container(
          height: MediaQuery.of(context).size.height * 0.41,
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InfiniteItem(),

            // child: ListView.builder(
            //   itemCount: 6,
            //   itemBuilder: (context, index) => ItemCard(
            //     width: 150,
            //   ),
            //   scrollDirection: Axis.horizontal,
            // ),
          ),
        ),
        //==============================        main item  Grid
        Container(
            padding: EdgeInsets.symmetric(horizontal: 3),
            margin: EdgeInsets.only(top: 10),
            child: MainGridBox())
      ],
    );
  }
}

class MainGridBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainGridBoxState();
}

class _MainGridBoxState extends State<MainGridBox> {
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (ctx, state) {
        if (state is ItemsLoadSuccess) {
          if (state.items.isEmpty) {
            return Center(child: Text("No Product"));
          }
          return GridView.builder(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              controller: scrollController,
              itemCount: state.hasReachedMax
                  ? state.items.length
                  : state.items.length + 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.63,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.items.length) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ItemCard(
                    item: state.items[index],
                    width: 150,
                  );
                }
              });
        }
        if (state is ItemLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Center(
          child: Column(
            children: [
              Text("Failed to load"),
              OutlinedButton(
                onPressed: () {
                  context.read<ItemBloc>().add(ItemLoad());
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    if (maxScroll - currentScroll <= 200.0) {
      BlocProvider.of<ItemBloc>(context).add(ItemLoad());
    }
  }
}

class SingleCategoryItem extends StatelessWidget {
  const SingleCategoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.grey[200], BlendMode.darken),
            fit: BoxFit.cover,
            image: AssetImage(
              "images/StateBags.jpg",
            )),
      ),
      width: MediaQuery.of(context).size.width / 3,
      height: 50,
    );
  }
}
