import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:insync/view/app_structure.dart';
import 'package:insync/view/authorization.dart';
import 'package:insync/utils/theme_config.dart';
import 'package:insync/view/splash.dart';
import 'dart:async';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes
      routes: {
        '/authorization': (context) => const Authorization(),
        '/mainapp': (context) => const MainApp(),
      },
      title: 'InSync',
      theme: lighttheme,
      home: const InSync(),
    );
  }
}

class InSync extends StatefulWidget {
  const InSync({Key? key}) : super(key: key);

  @override
  State<InSync> createState() => _InSyncState();
}

class _InSyncState extends State<InSync> {
  startTimeout() {
    return Timer(const Duration(milliseconds: 2200), handleTimeout);
  }

  void handleTimeout() {
    changeScreen();
  }

  changeScreen() async {
    Navigator.pushNamed(context, '/authorization');
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
    initialization();
  }

  void initialization() async {
    setState(() {});
    FlutterNativeSplash.remove();
    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return const Splash();
  }
}
