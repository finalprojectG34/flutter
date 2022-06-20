import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:sms/src/screens/components/single_address.dart';

import '../profile_page/profile_page_ctx.dart';
import 'address_input.dart';

class AddAddress extends StatelessWidget {
  static const String pathName = '/add_address';

  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProfilePageController>(builder: (ctx) {
      // logTrace('address',ctx.streetName.value);
      return Scaffold(
        // resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Modify Address'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SingleAddress(
                    country: ctx.address!.value.country!,
                    city: ctx.address!.value.city!,
                    streetName: ctx.address!.value.addressName!,
                    subCity: ctx.address!.value.subCity!,
                  ),
                ],
              ),
            ),
            // if (ctx.address!.value.country! == '')
            //   TextButton(
            //     onPressed: () {
            //       showModalBottomSheet(
            //         isDismissible: true,
            //         isScrollControlled: true,
            //         shape: const RoundedRectangleBorder(
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(10),
            //             topRight: Radius.circular(10),
            //           ),
            //         ),
            //         context: context,
            //         builder: (context) => Padding(
            //           padding: const EdgeInsets.symmetric(
            //               horizontal: 30, vertical: 10),
            //           child: SingleChildScrollView(
            //             child: Container(
            //               padding: EdgeInsets.only(
            //                   bottom: MediaQuery.of(context).viewInsets.bottom),
            //               child: AddressInput(
            //                 city: ctx.address!.value.city!,
            //                 subCity: ctx.address!.value.subCity!,
            //                 country: ctx.address!.value.country!,
            //                 streetName: ctx.address!.value.addressName!,
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //     child: Text('Add new location'),
            //   ),
          ],
        ),
      );
    });
  }
}
