import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenSliver extends SliverAppBar {
  final Function() onAddDeviceButton;
  final Function(String? value) onSeachbarChanged;
  const HomeScreenSliver(
      {Key? key,
      required this.onAddDeviceButton,
      required this.onSeachbarChanged})
      : super(key: key);

  @override
  double? get expandedHeight => 0;

  @override
  bool get floating => true;

  @override
  bool get pinned => false;

  @override
  List<Widget>? get actions => [
        ElevatedButton(
          onPressed: () {
            onAddDeviceButton();
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/devices.svg',
                color: Colors.white,
                height: 20,
              ),
              SizedBox(width: 10),
              Text('Add Device', style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ];

  @override
  PreferredSizeWidget? get bottom => AppBar(
        toolbarHeight: 60,
        shape: shape,
        title: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: TextField(
            onChanged: (String? value) {
              onSeachbarChanged(value);
            },
            decoration: const InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      );
}
