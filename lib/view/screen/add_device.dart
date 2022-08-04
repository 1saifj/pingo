import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo/controller/provider/device_provider.dart';
import 'package:pingo/model/device.dart';
import 'package:pingo/view/widget/textfield_widget.dart';

class AddDevice extends ConsumerStatefulWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddDeviceState();
}

class _AddDeviceState extends ConsumerState<AddDevice> {
  String? deviceName;
  String? deviceIp;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Device',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              )),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextfieldWidget(
                hintText: 'Device Name',
                onChanged: (value) {
                  setState(() {
                    deviceName = value;
                  });
                },
              ),
              TextfieldWidget(
                hintText: 'Device Ip',
                onChanged: (value) {
                  setState(() {
                    deviceIp = value;
                  });
                },
              ),
              TextfieldWidget(
                hintText: 'Workplace',
                onChanged: (value) {
                  print(value);
                },
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: _categoryDropDown()),
              ElevatedButton(
                  onPressed: () {
                    ref.read(deviceStateProvider).addDevice(Device(
                        id: 1,
                        name: deviceName!,
                        ip: deviceIp!,
                        workplaceName: 'najaf',
                        groupId: 2));
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done'))
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryDropDown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: Colors.grey),
          value: 'Computer',
          onChanged: (value) {},
          hint: const Text('Select a category'),
          items: [
            DropdownMenuItem(
                value: 'Computer',
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.computer),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Computer'),
                    ],
                  ),
                )),
            const DropdownMenuItem(
              value: 'Printer',
              child: Text(
                'print oifrf jfjdfkljfdsfd',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
