import 'package:flutter/material.dart';
import 'package:mini_ads/models/category.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final Category category;
  CategoryDetailsScreen({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini ads'),
      ),
      body: ListView.separated(
        itemCount: category.children.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(category.children[index].name),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}
