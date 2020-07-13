import 'package:flutter/material.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Colors.cyanAccent.shade200,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Product Name',
                            style: TextStyle(
                                color: Colors.cyan.shade900,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Price',
                            style: TextStyle(color: Colors.black),
                          ),
                          Text('type', style: TextStyle(color: Colors.black)),
                        ],
                      )),
                ),
                Container(
                  width: 250,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                      image: NetworkImage(
                          'https://www.bike-discount.de/media/owgr_1/k23216/k23546/504065_cubebikes2020.jpg'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
