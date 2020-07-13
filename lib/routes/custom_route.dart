import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mini_ads/routes/routes_names.dart';
import 'package:mini_ads/screens/search_screen.dart';
import 'package:mini_ads/screens/user-profile.dart';
import 'package:mini_ads/screens/setting_screen.dart';
import 'package:mini_ads/screens/Details_screen.dart';

class CustomRoute {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      case userProfile:
        return MaterialPageRoute(builder: (_) => UserProfile());
      case settingsRoute:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      case detailsScreen:
        return MaterialPageRoute(builder: (_) => DetailsScreen());
    }
  }
}
