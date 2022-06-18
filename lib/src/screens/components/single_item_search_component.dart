import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sms/src/app.dart';
import 'package:sms/src/screens/home_page/item_detail/item_detail.dart';

class SingleItemSearch extends StatelessWidget {
  final variable;
  final Item item;
  const SingleItemSearch({Key? key, this.variable, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Get.to(() => ItemDetails(item: variable));
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network("${item.poster}"),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.name}",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Text(
                        // variable['attrs'][0]['val'],
                        "${item.attrs != null && item.attrs!.isNotEmpty ? item.attrs?.elementAt(0).val : ""}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        if (item.price?.discountPrice != null) ...[
                          Text(
                            variable['price']['discountPrice'].toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                        Text(
                          "${item.price?.sale.toString()}",
                          style: TextStyle(
                              fontSize: 18,
                              color: item.price?.discountPrice != null
                                  ? Colors.grey
                                  : null,
                              fontWeight: FontWeight.bold,
                              decoration: item.price?.discountPrice != null
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
