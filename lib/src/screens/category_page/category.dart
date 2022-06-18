import 'package:flutter/material.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category Detail')),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('Electronics',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              textAlign: TextAlign.center),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Cat 1'),
              Text('  /  '),
              Text('Cat 1'),
              Text('  /  '),
              Text('Cat 1'),
              Text('  /  '),
              Text('Cat 1'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sub Category',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          // Row(
          //   children: [
          //     Text('Sub Category'),
          //     TextButton(onPressed: () {}, child: Text('More'))
          //   ],
          // ),
          // Text('Target'),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 120,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
                // CategoryItem(
                //   imagePath: Constants.foodImagePath,
                //   title: "Food",
                // ),
              ],
            ),
          ),
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     // if (incomeAndExpenseController != null)
          //     InkWell(
          //       child: Container(
          //         child: Icon(Icons.shop),
          //         padding: const EdgeInsets.all(8),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(100),
          //           // color: isSelected ? Colors.green.shade50 : null,
          //           border: Border.all(color: Colors.grey),
          //         ),
          //       ),
          //       borderRadius: BorderRadius.circular(50),
          //       onTap: () {},
          //     ),
          //     Text(
          //       'categoryName',
          //       textAlign: TextAlign.center,
          //       style: const TextStyle(
          //         fontSize: 14,
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
