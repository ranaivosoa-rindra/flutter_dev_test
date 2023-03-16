import 'package:flutter/material.dart';
import 'package:flutter_application_test/screens/home_screen.dart';
import 'package:get/get.dart';
import 'controler_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Application Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialBinding: ControllerBindings(),
      home: HomeScreen(),
    );
  }
}
