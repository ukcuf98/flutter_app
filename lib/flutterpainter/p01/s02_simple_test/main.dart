import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/flutterpainter/p01/s02_simple_test/paper.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight,DeviceOrientation.landscapeLeft]);
  runApp(Paper());
}