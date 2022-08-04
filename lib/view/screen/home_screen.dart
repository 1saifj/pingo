import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pingo/config/routes.dart';
import 'package:pingo/controller/provider/device_provider.dart';
import 'package:pingo/view/widget/searchbar_widget.dart';

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
        appBar: AppBar(
          title: const Text('Pingo'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(FontAwesomeIcons.plus),
              onPressed: () {
                //go to add_device route
                Navigator.pushNamed(context, Routes().addDevice);
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Pingo'),
              ),
              ListTile(
                title: Row(
                  children: const [
                    Icon(FontAwesomeIcons.cubes),
                    SizedBox(width: 20),
                    Text('Customize Devices'),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes().customizeDevices);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(FontAwesomeIcons.placeOfWorship,
                        color: Colors.grey[400]),
                    const SizedBox(width: 20),
                    const Text('Add Workplace'),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes().workplace);
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(FontAwesomeIcons.gears, color: Colors.grey[400]),
                    const SizedBox(width: 20),
                    const Text('Settings'),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, Routes().addDevice);
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: SearchbarWidget(
                onSearch: (String? value) {
                  //search device
                },
              ),
            ),
            ListView.separated(
              scrollDirection: Axis.vertical,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey[400],
                thickness: 0.2,
              ),
              shrinkWrap: true,
              itemCount: deviceState.devicesCount,
              itemBuilder: (BuildContext context, int index) {
                final devices = deviceState.devices;
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              ref.read(deviceStateProvider).checkAllDevices();
                            },
                            child: const Text('Check All Devices')),
                      ],
                    ),
                  );
                }
                return ListTile(
                  subtitle: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        devices[index].name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 200),
                      const Text(
                        'IP: ',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        devices[index].ip,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(width: 200),
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
                          color: devices[index].isOnline
                              ? Colors.green
                              : Colors.red,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            ref.read(deviceStateProvider).checkStatus(index);
                          },
                          icon: const Icon(Icons.check_circle_outline)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
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
          ],
        ));
  }
}
