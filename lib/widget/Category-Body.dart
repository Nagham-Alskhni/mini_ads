import 'package:flutter/material.dart';
import 'package:mini_ads/models/item.dart';

class Category_Body extends StatelessWidget {
//  whay i couldnt bulid constructor without final statement
  const Category_Body({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
//            height: 180,
//            width: 160,
            decoration: BoxDecoration(
              color: Color(0xff3776A6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.network(
              'https://en.louisvuitton.com/images/is/image/lv/1/PP_VP_L/louis-vuitton--M53151_PM2_Front%20view.jpg',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8 / 4,
          ),
          child: Text(
            item.title ?? "No Title",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            item.price.toString() ?? "No Price",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
