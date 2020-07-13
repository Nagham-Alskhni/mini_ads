import 'package:flutter/material.dart';
import 'package:mini_ads/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:mini_ads/provider/user_provider.dart';
import 'package:mini_ads/routes/custom_route.dart';
import 'package:mini_ads/routes/routes_names.dart';
import 'package:mini_ads/screens/change_language.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      builder: (context, child) {
        //final provider = Provider.of<UserProvider>(context);
        return MaterialApp(
          home: ChangeLanguage(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.cyanAccent,
            iconTheme: IconThemeData(
              color: Colors.cyanAccent.shade700,
            ),
          ),
          onGenerateRoute: CustomRoute.allRoutes,
          initialRoute: homeRoute,
        );
      },
    );
  }
}
