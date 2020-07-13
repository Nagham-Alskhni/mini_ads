class Item {
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
}
