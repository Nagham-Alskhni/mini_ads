// THIS WIDGET CAN BE DELETED

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_ads/models/item.dart';
import 'package:mini_ads/widget/Category-Body.dart';
import 'package:mini_ads/screens/search_screen.dart';

class CategoryCard extends StatefulWidget {
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  List<Widget> makeListView(AsyncSnapshot snapshot) {
    return snapshot.data.documents.map<Widget>((DocumentSnapshot document) {
      print('found item id: ${document.documentID}');
      return Category_Body(
        item: Item(
            id: document.documentID,
            title: document['title'],
            description: document['description'],
            images: document['images'],
            mainPhotoUrl: document['mainphotoUrl'],
            price: document['price'],
            isFavorite: document['isFavorite'],
            type: document['type']),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('Items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('error');
          if (snapshot.hasData) {
            print('there is data');
            //You need to put it here

          }
          if (!snapshot.hasData) return Text('no Data');

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('loading');
            default:
              if (snapshot.hasData)
                return Column(children: makeListView(snapshot));
              else
                return Text("No Data");
          }
        });
  }
}
