import 'package:flutter/material.dart';
import 'package:mini_ads/models/category.dart';
import 'package:mini_ads/provider/search_screen_provider.dart';

class CategoryIcons extends StatefulWidget {
  @override
  _CategoryIconsState createState() => _CategoryIconsState();
}

class _CategoryIconsState extends State<CategoryIcons> {
  int selectedIndex = 0;
//  final Function(Category) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    final categoriesList = SearchScreenProvider().categories;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text('Categories'),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      categoriesList[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Color(0xff3776A6)
                            : Colors.grey,
                      ),
                    ),
                    Container(
                      width: 30,
                      height: 2,
                      margin: EdgeInsets.only(top: 5),
                      color: selectedIndex == index
                          ? Colors.grey
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            ),

//      ListView(
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          for (Category categoryItem in SearchScreenProvider().categories)
//            Container(
//              width: 90,
//              height: 120,
//              child: Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    CircleAvatar(
//                      // backgroundColor: Color(0xFFAC7FFC),
//                      radius: 22.0,
//                      child: IconButton(
//                        //color: Colors.white,
//                        color: Colors.cyanAccent.shade700,
//                        icon: categoryItem.icon,
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                              builder: (context) => CategoryDetailsScreen(
//                                category: categoryItem,
//                              ),
//                            ),
//                          );
//                        },
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Text(
//                        categoryItem.name,
//                        style: TextStyle(fontSize: 11.0),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            )
//        ],
//
//      ),
          ),
        ),
      ],
    );
  }
}
