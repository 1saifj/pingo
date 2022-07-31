import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pingo/config/app_theme.dart';
import 'package:pingo/controller/provider/theme_state.dart';
import 'package:pingo/model/device.dart';
import 'package:pingo/view/widget/bottom_navigation.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(DeviceAdapter());
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeState).themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        body: CustomNavigationBar(),
      ),
    );
  }
}
