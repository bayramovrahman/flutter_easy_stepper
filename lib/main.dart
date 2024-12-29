import 'package:flutter/material.dart';
import 'package:flutter_easy_stepper/pages/easy_stepper_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Easy Stepper',
      home: EasyStepperWidget(),
    );
  }
}