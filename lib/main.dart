import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo/config/app_theme.dart';
import 'package:pingo/config/routes.dart';
import 'package:pingo/controller/provider/theme_state.dart';
import 'package:pingo/view/screen/home_view.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends ConsumerStatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      themeMode: ref.watch(themeState).themeMode,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      routes: Routes().urls(),
      initialRoute: Routes().home,
    );
  }
}
