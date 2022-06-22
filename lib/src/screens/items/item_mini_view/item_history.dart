import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:intl/intl.dart';

import '../../home_page/AppCtx.dart';

class ItemHistoryPage extends StatelessWidget {
  const ItemHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AppController>(builder: (ctx) {
      return ctx.gettingItemHistory.isTrue
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      'Item History',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Column(children: [
                                  Row(
                                    children: [
                                      Text(
                                        'previous owner Name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: Text(ctx.itemHistory![index]
                                                  .previousOwnerName ??
                                              ''))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'previous owner ID',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                          child: Text(ctx.itemHistory![index]
                                                  .previousOwner ??
                                              'none'))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'transfer date',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),

                                      // Text(ctx.itemHistory![index].transferDate!),

                                      Text(DateFormat('yyyy-MM-dd  kk:mm')
                                          .format(
                                              DateTime.fromMillisecondsSinceEpoch(
                                                  int.parse(ctx
                                                      .itemHistory![index]
                                                      .transferDate!)))
                                          .toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Action',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(ctx.itemHistory![index].action!)
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => Divider(
                          // color: Colors.grey,
                          ),
                      itemCount: ctx.itemHistory!.length),
                ],
              ),
          );
    });
  }
}
