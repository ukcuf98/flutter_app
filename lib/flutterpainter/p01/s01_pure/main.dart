import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/flutterpainter/p01/s01_pure/paper.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Paper());
}