import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/helper/constance.dart';

class SingleCart extends StatefulWidget {
  const SingleCart({Key? key}) : super(key: key);

  @override
  State<SingleCart> createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                  'assets/images/nike_shoe.jpg',
                  fit: BoxFit.fitHeight,
                  height: 120,
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                            child: Text(
                          'Nike cscbsjbc sdfasdfie oeoeo',
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: color1),
                        )),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          // splashRadius: 20,
                          child: Icon(
                            Icons.favorite_rounded,
                            color: Colors.red.shade300,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          // splashRadius: 20,
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ),
                      ],
                      //   )
                      // ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ETB 200.12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        SizedBox(
                          width: 100,
                          height: 26,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextButton(
                                    child: const Icon(
                                      Icons.remove,
                                    ),
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () async {
                                      // await FocusScope.of(context).unfocus();
                                      // incomeAndExpenseController.decreaseFrequencyValue(
                                      //     widget.categoryModel.id,
                                      //     widget.categoryModel.categoryId);
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextField(
                                    onTap: () {
                                      // frequency = widget.categoryModel.frequency.toString();
                                    },
                                    // focusNode: frequencyFocusNode,
                                    keyboardType: TextInputType.number,
                                    // controller: _frequencyController,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                      fillColor: color2,
                                      focusColor: color2,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      border: InputBorder.none,
                                      filled: true,

                                      // enabledBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.green, width: 0.5),
                                      // ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderSide: BorderSide(
                                      //       color: Colors.green, width: 0.75),
                                      // ),
                                      // contentPadding: EdgeInsets.only(bottom: 20),
                                    ),
                                    showCursor: false,

                                    onChanged: (givenFrequency) {
                                      print('given $givenFrequency');
                                      // frequency = givenFrequency;
                                    },
                                    onEditingComplete: () {
                                      FocusScope.of(context).unfocus();
                                    },
                                  ),
                                ),
                                Expanded(
                                  // flex: 2,
                                  child: TextButton(
                                    child: const Center(
                                      child: Icon(Icons.add),
                                    ),
                                    style: OutlinedButton.styleFrom(
                                        padding: EdgeInsets.zero),
                                    onPressed: () async {
                                      // await FocusScope.of(context).unfocus();
                                      // incomeAndExpenseController.increaseFrequencyValue(
                                      //     widget.categoryModel.id,
                                      //     widget.categoryModel.categoryId);
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
