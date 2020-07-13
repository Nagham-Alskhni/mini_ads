import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Opacity(
                opacity: 0.6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.all(8),
                  color: Colors.white70,
                  elevation: 0.10,
                  child: ListTile(
                    title: Text(
                      'Nagham Ahmad',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(''),
                    ),
                    trailing: Icon(Icons.edit),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.phone),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text('Change Number'),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text('Change Language'),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text('Change Language'),
                    onTap: null,
                  ),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    title: Text('Change Location'),
                    onTap: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
