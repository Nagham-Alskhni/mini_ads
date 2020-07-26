import 'dart:io';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mini_ads/models/Current-User.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String email;
  String name;
  String adress;
  File _image;
  bool _uploadingImage = false;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    final File file = File(pickedFile.path);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future uploadPic(BuildContext context) async {
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//    what is the below code ??
    final profilePhotoUrl = await taskSnapshot.ref.getDownloadURL();

    return profilePhotoUrl;
  }

  @override
  Widget build(BuildContext context) {
//    what for this line ??
    String newPhotoUrl;

    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: null,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: _image == null
                            ? NetworkImage(
                                Provider.of<CurrentUserProvider>(context)
                                        .user
                                        .profilePhotoUrl ??
                                    '')
                            : FileImage(
                                File(_image.path),
                              ),
                        radius: 25,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.cyan.shade200,
                            ),
                            onPressed: getImage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                controller: TextEditingController(
                    text: Provider.of<CurrentUserProvider>(context).user.name),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.cyan.shade900, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  name = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.cyan.shade900, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_location,
                    color: Colors.white,
                  ),
                  labelText: 'Adress',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.cyan.shade900, width: 3),
                      borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  adress = value;
                },
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              child: Text('SAVE'),
              onPressed: () async {
//                Provider.of<CurrentUserProvider>(context, listen: false)
//                    .user.name = name;

                //Write user name in firestore document /user/uid
                await Firestore.instance
                    .collection('users')
                    .document(
                        Provider.of<CurrentUserProvider>(context, listen: false)
                            .user
                            .id)
                    .setData({
                  'name': name,
                }, merge: true);
                newPhotoUrl = await uploadPic(context);

                await Firestore.instance
                    .collection('users')
                    .document(
                        Provider.of<CurrentUserProvider>(context, listen: false)
                            .user
                            .id)
                    .setData({
                  'profilePhotoUrl': newPhotoUrl,
                }, merge: true);

//                changeUserPhoto(newPhotoUrl);
              },
            )
          ],
        ),
      ),
    );
  }
}
