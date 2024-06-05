import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'global/sharedpref.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/index.dart';

void main() async {
  await setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Index(),
    );
  }
}

Future<void> setupDi() async {
  final getIt = GetIt.instance;

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerSingleton<AppSharedPref>(AppSharedPref(sharedPref));
}
