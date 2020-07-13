import 'package:flutter/material.dart';

class ItemTitlePrice extends StatelessWidget {
  const ItemTitlePrice({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Exchange',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Text(
            'Hand Bag',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Price\n'),
                    TextSpan(
                      text: '\ EGP 2000',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
//              Expanded(
//                child: Image.network(
//                    'https://www.luxury-shops.com/media/catalog/product/cache/a2447e32dcb88d01aff387e8724fb8b7/5/6/56720_1.jpg'),
//              ),
            ],
          )
        ],
      ),
    );
  }
}
