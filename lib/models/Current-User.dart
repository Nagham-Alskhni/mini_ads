import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mini_ads/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUserProvider extends ChangeNotifier {
  User user;
  FirebaseUser firebaseUser;
  StreamSubscription<FirebaseUser> _authListener;
//not a constructure>????
  CurrentUserProvider() {
    print('initializing current user provider...');
    _authListener = FirebaseAuth.instance.onAuthStateChanged.listen((newUser) {
      print('got authstatechanged event');
      if (newUser == null) {
        print('auth user is null');
        //no user. User might have signed out
        firebaseUser = user = null;
      } else {
        print('auth user is not null');
        //user logged in
//        the first two line??
        firebaseUser = newUser;
        user = User();
        user.profilePhotoUrl = newUser.photoUrl;
        user.phone = newUser.phoneNumber;
        user.name = newUser.displayName;
        user.id = newUser.uid;

        Firestore.instance
            .collection('users')
            .document(user.id)
            .snapshots()
            .listen((event) {
          if (event.exists) {
            // read user data from firestore
            print('received user data from firestore');
            print(event.data);
            user = User.fromJson(event.data);
            notifyListeners();
          } else {
//            event.reference.setData({
//              'name': user.name,
//              'phone': user.phone,
//              'profilePhotoUrl': user.profilePhotoUrl
//            });

            print('writing user data to firestore');
            event.reference.setData(user.toJson());
          }
        });
      }
    });
  }

  changeUserPhoto(newPhotoUrl) async {
    final userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.photoUrl = newPhotoUrl;
    await firebaseUser.updateProfile(userUpdateInfo);
    user.profilePhotoUrl = newPhotoUrl;
    notifyListeners();
  }
}
