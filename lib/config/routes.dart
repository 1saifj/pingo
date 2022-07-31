import 'package:flutter/material.dart';
import 'package:pingo/view/screen/home_screen.dart';
import 'package:pingo/view/screen/settings_screen.dart';

class Routes {
  String home = '/';

  Map<String, Widget Function(BuildContext)> urls() {
    return {
      '/': (context) => HomeView(),
      '/settings': (context) => const SettingsScreen(),
    };
  }
}
