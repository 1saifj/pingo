import 'package:pingo/model/device.dart';

class Group {
  final int id;
  final String name;
  final List<Device> devices;

  Group({required this.id, required this.name, required this.devices});
}
