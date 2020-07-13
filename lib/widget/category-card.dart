import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
            'product name',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Text(
            'product price',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
