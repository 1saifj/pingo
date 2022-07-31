import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pingo/controller/provider/device_provider.dart';
import 'package:pingo/model/device.dart';
import 'package:pingo/service/ping_device.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  //fake devices

  @override
  Widget build(BuildContext context) {
    final deviceState = ref.watch(deviceStateProvider);
    deviceState.getDevices();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(deviceStateProvider).addDevice(Device(
                id: 1,
                name: 'Device 1',
                ip: '192',
                groupId: 1,
              ));
        },
        child: const Icon(FontAwesomeIcons.plus),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListView.builder(
          itemCount: deviceState.devicesCount,
          itemBuilder: (BuildContext context, int index) {
            final devices = deviceState.devices;
            return ListTile(
              subtitle: Row(
                children: [
                  const SizedBox(width: 10),
                  Text(
                    'Name: ${devices[index].name}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 100),
                  const Text(
                    'Status: ',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    devices[index].isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Roboto',
                      color:
                          devices[index].isOnline ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //button
                  FloatingActionButton(
                      heroTag: null,
                      onPressed: () async {
                        ref.read(deviceStateProvider).checkStatus(index);
                      },
                      child: const Icon(Icons.check)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        deviceState.removeDevice(index);
                      },
                      icon: const Icon(Icons.delete)),
                ],
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
