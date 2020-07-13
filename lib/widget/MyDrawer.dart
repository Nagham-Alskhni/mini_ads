import 'package:flutter/material.dart';
import 'package:mini_ads/screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('nagham alskhni'),
          accountEmail: Text('customer.nagham@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text('image'),
          ),
        ),
        ListTile(
          title: Text('Profile'),
          trailing: Icon(Icons.supervised_user_circle),
        ),
        ListTile(
          title: Text('my Favourit'),
          trailing: Icon(Icons.favorite_border),
        ),
        ListTile(
          title: Text('setting'),
          trailing: Icon(Icons.settings),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingScreen()),
            );
          },
        ),
      ],
    );
  }
}
