import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';

class PingDevice extends ChangeNotifier {
  final bool isOnline;

  PingDevice(this.isOnline);

  static Future<bool> checkStatus(ip) async {
    Ping ping = Ping(ip);
    bool result = await ping.stream.first.then<bool>((value) async {
      if (value.error != null) {
        //update device status in device_porovider
        return false;
      }

      return true;
    }).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return false;
      },
    );
    return result;
  }
}
