import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/flutterpainter/p02_paint/level1/paper.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(Paper());
}