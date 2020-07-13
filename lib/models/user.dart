class User {
  User(
      {this.name,
      this.number,
      this.profilePhotoUrl,
      this.id,
      this.myItems,
      this.favoriteItems,
      this.location});
  String name;
  String number;
  dynamic location;
  List<String> favoriteItems;
  List<String> myItems;
  String profilePhotoUrl;
  String id;
}
