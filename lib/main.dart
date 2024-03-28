import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_ux_project/screens/on_boarding.dart';
import 'package:ui_ux_project/utitls/style/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor
      ),
      home: const OnBoarding(),
    );
  }
}
