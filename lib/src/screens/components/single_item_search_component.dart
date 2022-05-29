import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleItemSearch extends StatelessWidget {
  const SingleItemSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(onTap: (){},
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                    "https://fdn.gsmarena.com/imgroot/reviews/20/apple-iphone-12-pro-max/lifestyle/-1200w5/gsmarena_008.jpg"),
              ),
              SizedBox(width: 20,),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('item name',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 5,),
                    Text('Brand new',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Text('26,000 birr',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
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
