import 'package:flutter/material.dart';
import 'package:mini_ads/models/category.dart';
import 'package:mini_ads/models/item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreenProvider extends ChangeNotifier {
  String searchInputText;
  String selectedCityName;
  Category selectedCategory;
  String selectedType;
  List<Item> itemsList;
  doSearch() {
    //TODO
    print('Searching for $searchInputText');
  }

  List<String> iconName = [
    'Apatments',
    'Books',
    'Cars',
    'Clothes',
    'Laptop&Computers',
    'Medecine',
    'Mobile',
  ];

  List<Category> categories = [
    Category(
      name: "Medicine",
      icon: FaIcon(FontAwesomeIcons.medapps),
      children: [
        Category(
          name: 'Medicine',
        ),
        Category(name: 'All Medicine'),
        Category(name: 'Medical Appliances'),
      ],
    ),
    Category(
      name: 'Mobiles',
      icon: Icon(Icons.mobile_screen_share),
      children: [
        Category(name: 'All Mobiles'),
        Category(name: 'Samsung'),
        Category(
          name: 'IPhone',
        ),
        Category(name: 'Hawawi'),
        Category(name: 'Shawmi'),
        Category(name: 'Other'),
      ],
    ),
    Category(
      name: "Furniture",
      icon: Icon(Icons.home),
      children: [
        Category(name: 'All Furniture'),
        Category(name: 'Beds'),
        Category(name: "Bedrooms"),
        Category(name: "Carpets"),
        Category(name: "Diningroom"),
        Category(name: "Salon"),
        Category(name: "Kitchen tools"),
        Category(name: "Other"),
      ],
    ),
    Category(
      name: "Clothes",
      icon: FaIcon(FontAwesomeIcons.tshirt),
      children: [
        Category(name: 'All Clothes'),
        Category(name: 'Men'),
        Category(name: "Women"),
        Category(name: "Kids"),
        Category(name: "Beach Wear for Men"),
        Category(name: "Beach Wear for Women"),
        Category(name: "Other"),
      ],
    ),
    Category(
      name: "Apartment",
      icon: FaIcon(FontAwesomeIcons.tshirt),
      children: [
        Category(name: 'All Apartment'),
        Category(name: 'Rent'),
        Category(name: "Sell"),
      ],
    ),
    Category(
      name: "Books",
      icon: FaIcon(FontAwesomeIcons.tshirt),
      children: [
        Category(name: 'All Books'),
        Category(name: 'Novel'),
        Category(name: "Langueges Books"),
        Category(name: "Cook Books"),
      ],
    ),
    Category(
      name: "Cars",
      icon: FaIcon(FontAwesomeIcons.car),
      children: [
        Category(name: 'All Cars'),
        Category(name: 'Cars'),
        Category(name: 'Boat & Boat Accessories'),
        Category(name: "Motorbike and scooter"),
        Category(name: "Cook Books"),
      ],
    ),
    Category(
      name: "Laptp and Computers",
      icon: FaIcon(FontAwesomeIcons.laptop),
      children: [
        Category(name: 'All Laptop & Computers'),
        Category(name: 'Laptops'),
        Category(name: "Computers"),
        Category(name: "PlayStation"),
      ],
    ),
    Category(
      name: "Others",
      icon: FaIcon(FontAwesomeIcons.motorcycle),
    ),
  ];
}
