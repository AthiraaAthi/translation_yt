import 'package:auto_translate_checking/pages/about_page.dart';
import 'package:auto_translate_checking/pages/home_page.dart';
import 'package:auto_translate_checking/pages/settings_page.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());

      case aboutRoute:
        return MaterialPageRoute(builder: (_) => AboutPage());

      default:
        return MaterialPageRoute(builder: (_) => SettingsPage());
    }
  }
}

//route_constants

const String homeRoute = "home";
const String aboutRoute = "about";
const String settingsRoute = "settings";
