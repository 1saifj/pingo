import 'package:pingo/model/device.dart';

class Group {
  final int id;
  final String name;
  final List<Device> devices;

  Group({required this.id, required this.name, required this.devices});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      devices: (json['devices'] as List<dynamic>)
          .map((dynamic device) => Device.fromJson(device))
          .toList(),
    );
  }
}
