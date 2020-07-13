import 'package:flutter/material.dart';

class Category {
  final String name;
  final Widget icon;
  final List<Category> children;

  Category({
    this.name,
    this.icon,
    this.children,
  });
}
