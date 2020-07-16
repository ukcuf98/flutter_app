import 'package:flutter/material.dart';
//使用缓存https://github.com/mjl0602/local_cache_sync
//import 'package:local_cache_sync/local_cache_sync.dart';
//import 'package:path_provider/path_provider.dart';
////默认的flutter demo及其他简单示例
//import 'package:flutterapp/test/MyApp.dart';
//生成单词列表、收藏、打开新页面示例
//import 'package:flutterapp/randomword/randomword.dart';
//框架概览
//import 'package:flutterapp/structureoverview/structureoverview.dart';
//ar
//import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart' show ArCoreController;
//import 'package:flutterapp/ar/app.dart';
//文件选择，但是还无法读取文件
//import 'package:flutterapp/filepicker/app.dart';
// 仿掘金页面
import 'package:flutterapp/juejinmy/MyApp.dart';
void main() async {
//  //缓存使用设置start
//  WidgetsFlutterBinding.ensureInitialized();
//  LocalCacheSync.instance.setCachePath(
//      await getTemporaryDirectory(),
//  'example_app/',
//  );
//  //缓存使用设置end
//  //ar使用start
//  WidgetsFlutterBinding.ensureInitialized();
//  print('ARCORE IS AVAILABLE?');
//  print(await ArCoreController.checkArCoreAvailability());//无该方法?
  //ar使用end
  runApp(MyApp());
}