import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo/controller/provider/theme_state.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final trueDark = ref.watch(themeState).isDark;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
        child: SingleChildScrollView(
            child: IconButton(
          onPressed: () => ref.watch(themeState).changeDark(!trueDark),
          icon: ref.watch(themeState).themeMode == ThemeMode.light
              ? const Icon(Icons.brightness_3)
              : const Icon(Icons.brightness_7),
        )),
      ),
    );
  }
}
