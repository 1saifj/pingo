import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:pingo/view/screen/home_screen.dart';
import 'package:pingo/view/screen/settings_screen.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final List<Widget> _mainContents = [
    const HomeView(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  int _selectedIndex = 0;

  List<String> labels = [
    'Devices',
    'Settings',
  ];

  List<Icon> icons = const [
    Icon(FluentSystemIcons.ic_fluent_home_regular),
    Icon(FluentSystemIcons.ic_fluent_settings_regular),
  ];

  List<Icon> activeIcons = const [
    Icon(FluentSystemIcons.ic_fluent_home_filled),
    Icon(FluentSystemIcons.ic_fluent_settings_filled),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              elevation: 1,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.blue,
              unselectedItemColor: const Color(0xFF8E8E93),
              onTap: _onItemTapped,
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.shifting,
              items: labels
                  .map((label) => BottomNavigationBarItem(
                        icon: icons[labels.indexOf(label)],
                        activeIcon: activeIcons[labels.indexOf(label)],
                        label: label,
                      ))
                  .toList(),
            )
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 30.0,
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: TextStyle(
                color: Colors.grey[600],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
              unselectedLabelTextStyle: TextStyle(
                color: Colors.grey[400],
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w300,
              ),
              destinations: labels
                  .map((label) => NavigationRailDestination(
                        icon: icons[labels.indexOf(label)],
                        selectedIcon: activeIcons[labels.indexOf(label)],
                        label: Text(label),
                      ))
                  .toList(),
            ),
          Expanded(child: _mainContents[_selectedIndex]),
        ],
      ),
    );
  }
}
