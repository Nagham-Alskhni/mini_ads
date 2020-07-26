import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:mini_ads/models/item.dart';
import 'package:mini_ads/widget/category-card.dart';

import 'Category-Body.dart';

class GridViewWidget extends StatefulWidget {
  final num longitude;
  final num latitude;
  GridViewWidget({this.longitude, this.latitude});
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  //This function makeWidgetsList converts the QuerySnapshot coming from Firestore to a list of item cards (Widgets)
  List<Widget> makeWidgetsList(AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
    return snapshot.data.map<Widget>((DocumentSnapshot document) {
      print('found item id: ${document.documentID}');

      // Return a list of widgets of Category_Body
      return Category_Body(
        item:
            // Category_Body takes an object of type Item
            // so we need to convert the document coming from Firestore to an Item object
            Item(
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
    // To show user items based on their location we need to use the GeoFlutterFire stream
    // instead of the Firestore stream

    Geoflutterfire geo = Geoflutterfire();

    //this is the center location or the location of the user
    // we want GeoFireStore to bring all items around this location
    GeoFirePoint center = geo.point(latitude: widget.latitude, longitude: widget.longitude);

    // This is to tell GeoFirestore where the items collection is in Firestore
    var collectionReference = Firestore.instance.collection('Items');

    // radius the kilometers around the center points where we want to search for items
    // here we want items that are in area of 50km around the user
    double radius = 50;

    // field is the field in Items document where we saved the location before (see CreateItem)
    String field = 'location';

    final stream = geo
        .collection(collectionRef: collectionReference)
        .within(center: center, radius: radius, field: field);

    return StreamBuilder(
        stream: stream, //stream of all documents in Items collection
        builder: (BuildContext context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('loading');
            default:
              if (snapshot.hasError) return Text('error');

              if (snapshot.hasData) {
                // Received data from Firestore
                //create a list of widgets to put later in the GridView using our function
                final widgetsList = makeWidgetsList(snapshot);

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 10,
                        childAspectRatio: .90,
                      ),

                      //The itemBuilder of the GridView returns each item according to index
                      // index is a counter from zero till equal to itemCount
                      // since we already have a list of all item cards (widgetsList)
                      // we can simply return each item card as widgetList[index] to the itemBuilder
                      itemBuilder: (context, index) => widgetsList[index],

                      // The count of items in the GridView is equal to the items in the list
                      itemCount: widgetsList.length,

                      // LOVE YOU ❤
                    ),
                  ),
                );
              } else
                return Text("No Data");
          }
        });

//    return StreamBuilder<QuerySnapshot>(
//        stream:
//        Firestore.instance
//            .collection('Items')
//            .snapshots(), //stream of all documents in Items collection
//        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//          switch (snapshot.connectionState) {
//            case ConnectionState.waiting:
//              return Text('loading');
//            default:
//              if (snapshot.hasError) return Text('error');
//
//              if (snapshot.hasData) {
//                // Received data from Firestore
//                //create a list of widgets to put later in the GridView using our function
//                final widgetsList = makeWidgetsList(snapshot);
//
//                return Expanded(
//                  child: Padding(
//                    padding: const EdgeInsets.symmetric(horizontal: 8),
//                    child: GridView.builder(
//                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                        crossAxisCount: 2,
//                        mainAxisSpacing: 20,
//                        crossAxisSpacing: 10,
//                        childAspectRatio: .90,
//                      ),
//
//                      //The itemBuilder of the GridView returns each item according to index
//                      // index is a counter from zero till equal to itemCount
//                      // since we already have a list of all item cards (widgetsList)
//                      // we can simply return each item card as widgetList[index] to the itemBuilder
//                      itemBuilder: (context, index) => widgetsList[index],
//
//                      // The count of items in the GridView is equal to the items in the list
//                      itemCount: widgetsList.length,
//
//                      // LOVE YOU ❤
//                    ),
//                  ),
//                );
//              } else
//                return Text("No Data");
//          }
//        });
  }
}
