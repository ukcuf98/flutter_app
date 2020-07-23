import 'package:flutter/material.dart';
import 'package:flutterapp/fclock/clockpage.dart';

/// 模仿 https://github.com/Rahul-Blatz/Complete-Analog-and-Digital-World-Clock-Flutter
/// 只有数字和表盘部分
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: ClockPage(),
    );
  }
}
