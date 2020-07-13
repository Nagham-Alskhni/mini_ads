import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_ads/provider/search_screen_provider.dart';
import 'package:mini_ads/provider/user_provider.dart';
import 'package:mini_ads/widget/category_icon_widget.dart';
import 'package:mini_ads/widget/my_gradient_button.dart';
import 'package:provider/provider.dart';
import 'package:mini_ads/widget/ItemCard.dart';
import 'package:mini_ads/widget/MyDrawer.dart';
import 'package:mini_ads/widget/Grid_View.dart';
import 'package:mini_ads/screens/creat_item.dart';
import 'package:mini_ads/screens/setting_screen.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

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
                    MaterialPageRoute(builder: (context) => CreatItem()),
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
                    GridViewWidget(),

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
