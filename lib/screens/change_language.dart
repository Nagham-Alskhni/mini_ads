import 'package:flutter/material.dart';
import 'package:mini_ads/classes/languages.dart';
import 'package:mini_ads/classes/languages.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  void _changeLanguage(Languages languages) {
    print(languages.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Language'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SingleChildScrollView(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.phone),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text(Languages().name),
//                    onTap: () {
//                      _changeLanguage(languages);
//                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text('English'),
                    onTap: null,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
