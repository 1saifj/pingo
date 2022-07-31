import 'package:flutter/material.dart';
import 'package:pingo/view/screen/home_view.dart';

class Routes {
  String home = '/';

  Map<String, Widget Function(BuildContext)> urls() {
    return {
      '/': (context) =>
          Directionality(textDirection: TextDirection.rtl, child: HomeView()),
    };
  }
}
