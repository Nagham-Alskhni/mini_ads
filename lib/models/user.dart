//class User {
//  User(
//      {this.name,
//      this.number,
//      this.profilePhotoUrl,
//      this.id,
//      this.myItems,
//      this.favoriteItems,
//      this.location});
//  String name;
//  String number;
//  dynamic location;
//  List<String> favoriteItems;
//  List<String> myItems;
//  String profilePhotoUrl;
//  String id;
//
//  static User fromMap(Map<String, dynamic> json) {
//    return User(
//      name: json['name'],
//      number: json['phone'],
//    );
//  }
//}

class User {
  String name;
  String phone;
  String id;
  String profilePhotoUrl;
  String location;
  double longitude;
  double latitude;
  List<String> myItems;
  List<String> favoriteItems;

  User(
      {this.name,
      this.phone,
      this.id,
      this.profilePhotoUrl,
      this.location,
      this.longitude,
      this.latitude,
      this.myItems,
      this.favoriteItems});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    id = json['id'];
    profilePhotoUrl = json['profilePhotoUrl'];
    location = json['location'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    myItems = json['myItems'];
    favoriteItems = json['favoriteItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['id'] = this.id;
    data['profilePhotoUrl'] = this.profilePhotoUrl;
    data['location'] = this.location;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['myItems'] = this.myItems;
    data['favoriteItems'] = this.favoriteItems;
    return data;
  }
}
