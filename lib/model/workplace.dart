import 'package:hive/hive.dart';

part 'workplace.g.dart';

@HiveType(typeId: 1)
class Workplace {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? location;
  Workplace({required this.id, required this.name, required this.location});
}
