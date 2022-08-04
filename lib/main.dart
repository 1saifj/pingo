import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pingo/config/routes.dart';
import 'package:pingo/controller/provider/theme_state.dart';
import 'package:pingo/model/device.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pingo/model/workplace.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(DeviceAdapter());
  Hive.registerAdapter(WorkplaceAdapter());

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
      routes: Routes().urls(),
      initialRoute: Routes().home,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness:
            ref.watch(themeState).isDark ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
