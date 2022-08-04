import 'package:hive/hive.dart';

part 'device.g.dart';

@HiveType(typeId: 0)
class Device {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String ip;
  @HiveField(3)
  final int groupId;
  @HiveField(4)
  bool isOnline;
  @HiveField(5)
  String? workplaceName;
  @HiveField(6)
  Device(
      {required this.id,
      required this.name,
      required this.ip,
      required this.groupId,
      required this.workplaceName,
      this.isOnline = false});
}
