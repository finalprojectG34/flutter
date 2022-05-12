import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleCart extends StatefulWidget {
  const SingleCart({Key? key}) : super(key: key);

  @override
  State<SingleCart> createState() => _SingleCartState();
}

class _SingleCartState extends State<SingleCart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 100, child: Image.asset('assets/images/nike_shoe.jpg')),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                          'Nike cscbsjbc kjdfbvjb fdvjb jh bjkbhjbd',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: Icon(
                                Icons.favorite_rounded,
                                color: Colors.red.shade300,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              splashRadius: 20,
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'ETB 200.12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: SizedBox(
                            width: 100,
                            height: 30,
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
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.green, width: 0.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.green, width: 0.75),
                                        ),
                                        // contentPadding: EdgeInsets.only(bottom: 20),
                                      ),
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
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
