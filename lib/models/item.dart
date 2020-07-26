import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String id;
  String category;
  String title;
  String mainPhotoUrl;
  String price;
  bool isFavorite;
  String type;
  String description;
  List<String> images;
  String cityName;

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  Item({
    this.id,
    this.title,
    this.images,
    this.isFavorite,
    this.mainPhotoUrl,
    this.price,
    this.category,
    this.type,
    this.description,
    this.cityName,
  });

  Future<void> getItems(
    String title,
    String price,
    String category,
    bool isFavorite,
    String mainPhotoUrl,
    String type,
    String cityName,
    String description,
    String id,
  ) {
    return Firestore.instance.collection('Items').add({
      'title': title,
      'price': price,
      'category': category,
      'type': type,
      'isFavorite': isFavorite,
      'cirtyName': cityName,
      'descreption': description,
      'mainPhotoUrl': mainPhotoUrl,
      'images': images,
      'id': id,
    });
//        .where('title', isEqualTo: title)
//        .where('price', isEqualTo: price)
//        .where('isFavorite', isEqualTo: isFavorite)
//        .where('type', isEqualTo: type)
//        .where('descreption', isEqualTo: description)
//        .where('mainPhotoUrl', isEqualTo: mainPhotoUrl)
//        .where('images', isEqualTo: images)
//        .where('cityName', isEqualTo: cityName)
//        .where('category', isEqualTo: category)
//        .snapshots();
  }

//  Item.fromJson(Map<String, dynamic> json) {
//    price = json['price'];
//    type = json['type'];
//    id = json['id'];
//    title = json['title'];
//    description = json['description'];
//    cityName = json['cityName'];
//    isFavorite = json['favorite'];
//    mainPhotoUrl = json['mainPhoto'];
//    category = json['category'];
//    images = json['images'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['title'] = this.title;
//    data['price'] = this.price;
//    data['id'] = this.id;
//    data['description'] = this.description;
//    data['favorite'] = this.isFavorite;
//    data['mainPhoto'] = this.mainPhotoUrl;
//    data['images'] = this.images;
//    data['type'] = this.type;
//    data['category'] = this.category;
//    return data;
//  }
}
