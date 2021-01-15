import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/flutterpainter/p01/paper.dart';

void main(){
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Paper());
}