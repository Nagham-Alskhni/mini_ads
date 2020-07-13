import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mini_ads/widget/category-card.dart';

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<String> data = ['1', ' 2'];
  @override
  Widget build(BuildContext context) {
    return Expanded(
//      padiing cymatric
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 10,
            childAspectRatio: .90,
          ),
//          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => CategoryCard(),
          itemCount: 25,
        ),
      ),
    );
  }
}
