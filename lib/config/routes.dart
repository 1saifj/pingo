import 'package:flutter/material.dart';
import 'package:pingo/view/screen/add_device.dart';
import 'package:pingo/view/screen/add_workplace.dart';
import 'package:pingo/view/screen/customize_devices.dart';
import 'package:pingo/view/screen/home_screen.dart';
import 'package:pingo/view/screen/workplace_screen.dart';

class Routes {
  String home = '/';
  String addDevice = '/add_device';
  String customizeDevices = '/customize_devices';
  String addWorkplace = '/add_workplace';
  String workplace = '/workplace';

  Map<String, Widget Function(BuildContext)> urls() {
    return {
      '/': (context) => const HomeView(),
      '/add_device': (context) => const AddDevice(),
      '/add_workplace': (context) => const AddWorkplace(),
      '/workplace': (context) => const WorkplaceScreen(),
      '/customize_devices': (context) => const CustomizeDevices(),
    };
  }
}
