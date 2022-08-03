import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:pingo/model/device.dart';

final deviceStateProvider =
    ChangeNotifierProvider<DeviceProvider>((ref) => DeviceProvider());

class DeviceProvider extends ChangeNotifier {
  final List<Device> _devices = [];

  List<Device> get devices => _devices;
  int get devicesCount => _devices.length;

  void getDevices() async {
    final box = await Hive.openBox<Device>('devices');
    final devices = box.values.toList();
    _devices.clear();
    _devices.addAll(devices);
    notifyListeners();
  }

  void addDevice(Device device) async {
    var devicesBox = await Hive.openBox<Device>('devices');
    devicesBox.add(device);
    notifyListeners();
  }

  void removeDevice(index) async {
    var devicesBox = await Hive.openBox<Device>('devices');
//delete key from box
    devicesBox.deleteAt(index);
    notifyListeners();
  }

  void updateDevice(Device device) {
    _devices.removeWhere((element) => element.id == device.id);
    _devices.add(device);
    notifyListeners();
  }

  Future<bool> checkStatus(index) async {
    Ping ping = Ping(_devices[index].ip);
    bool result = await ping.stream.first.then<bool>((value) async {
      if (value.error != null) {
        _devices[index].isOnline = false;
        return false;
      }
      _devices[index].isOnline = true;
      return true;
    }).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        _devices[index].isOnline = false;
        return false;
      },
    );
    notifyListeners();
    return result;
  }

  void searchDevices(String value) async {
    final box = await Hive.openBox<Device>('devices');
    final devices = box.values.toList();
    _devices.clear();
    if (value.isEmpty) {
      getDevices();
      return;
    }
    _devices.addAll(devices.where((element) => element.name.contains(value)));
    notifyListeners();
  }

  void checkAllDevices() async {
    for (int i = 0; i < _devices.length; i++) {
      await checkStatus(i);
    }
  }
}
