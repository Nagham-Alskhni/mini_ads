import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_ads/models/Current-User.dart';
import 'package:mini_ads/provider/search_screen_provider.dart';
import 'package:mini_ads/provider/user_provider.dart';
import 'package:mini_ads/widget/category-card.dart';
import 'package:mini_ads/widget/category_icon_widget.dart';
import 'package:provider/provider.dart';
import 'package:mini_ads/widget/ItemCard.dart';
import 'package:mini_ads/widget/MyDrawer.dart';
import 'package:mini_ads/widget/Grid_View.dart';
import 'package:mini_ads/screens/creat_item.dart';
import 'package:mini_ads/widget/Category-Body.dart';
import 'package:mini_ads/models/item.dart';
import 'package:geolocator/geolocator.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Position _position;
  StreamSubscription<Position> _positionStream;
  @override
  void initState() {
    super.initState();
    var locationOption =
        LocationOptions(accuracy: LocationAccuracy.low, distanceFilter: 16);
    //TODO get user location only once instead of a stream

    _positionStream = Geolocator()
        .getPositionStream(locationOption)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());

      setState(() {
        print(position);
        _position = position; //user location is save in variable _position
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _positionStream.cancel();
  }

  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUserProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => SearchScreenProvider(),
      builder: (context, child) {
        return Consumer<SearchScreenProvider>(
          builder: (context, provider, child) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.grey),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: 'Search for Items'),
                        onChanged: (value) {
                          provider.searchInputText = value;
                        },
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        onPressed: provider.doSearch),
                  ],
                ),
              ),
              drawer: Drawer(
                child: MyDrawer(),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,

                    // we need to send the user position when creating new item
                    // because we need the item to have a location
                    MaterialPageRoute(
                        builder: (context) => CreatItem(
                              longitude: _position.longitude,
                              latitude: _position.latitude,
                            )),
                  );
                },
                child: Icon(Icons.add),
                backgroundColor: Colors.cyan,
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CategoryIcons(),
                    SizedBox(height: 20),

                    //GridViewWidget streams items from Firestore
                    // in order to show the user the items that are only around them
                    // we first need to pass the user's longitude and latitude to GridViewWidget
                    GridViewWidget(
                      longitude: _position.longitude,
                      latitude: _position.latitude,
                    ),
                    //CategoryCard(),

//                    MyGradientButton(
//                      child: Text('My Button'),
//                      onPressed: () {},
//                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
