import 'package:flutter/material.dart';
import 'package:mini_ads/models/Current-User.dart';
import 'package:mini_ads/screens/setting_screen.dart';
import 'package:mini_ads/screens/user-profile.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CurrentUserProvider>(context).user;
    return ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text(user.name ?? 'Guest'),
          accountEmail: Text('customer.nagham@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Image.network(
                Provider.of<CurrentUserProvider>(context).user.profilePhotoUrl),
          ),
        ),
        ListTile(
          title: Text('Profile'),
          trailing: Icon(Icons.supervised_user_circle),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfile()));
          },
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
