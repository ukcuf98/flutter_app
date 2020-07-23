import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutterapp/fclock/constants.dart';
import 'package:flutterapp/fclock/clock_container.dart';
import 'package:flutterapp/fclock/clock_hands.dart';

class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  String _formattedTime = '';
  @override
  void initState(){
    //设置定时，每秒钟刷新页面显示
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        _getFormattedTime();
      }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(silver),
        body: Column(
          children: [
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                child: Container(
                  child: Text(
                    "$_formattedTime",
                    style: kTimeTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: ClockContainer(
                child: CustomPaint(
                  painter: ClockHands(),
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  void _getFormattedTime(){
    String formattedTime = DateFormat("HH:mm:ss a").format(DateTime.now());
    setState(() {
      _formattedTime = formattedTime;
    });
  }
}
