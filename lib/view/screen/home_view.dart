import 'package:flutter/material.dart';
import 'package:pingo/model/device.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
//make fakedevices
  List<Device> devices = [
    Device(
      name: 'Device 1',
      ip: '192.168.0.68',
      groupId: 1,
    ),
    Device(
      name: 'Device 2',
      ip: '192.168.4.199',
      groupId: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: devices.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(devices[index].name),
              subtitle: Text(devices[index].ip),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
