class Device {
  final String name;
  final String ip;
  final int groupId;

  Device({required this.name, required this.ip, required this.groupId});

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      name: json['name'],
      ip: json['ip'],
      groupId: json['groupId'],
    );
  }
}
