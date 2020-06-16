import 'package:flutter/material.dart';
//使用缓存https://github.com/mjl0602/local_cache_sync
import 'package:local_cache_sync/local_cache_sync.dart';
import 'package:path_provider/path_provider.dart';
//默认的flutter demo及其他简单示例
import 'package:flutterapp/test/MyApp.dart';
//生成单词列表、收藏、打开新页面示例
//import 'package:flutterapp/randomword/randomword.dart';
//框架概览
//import 'package:flutterapp/structureoverview/structureoverview.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalCacheSync.instance.setCachePath(
      await getTemporaryDirectory(),
  'example_app/',
  );

  runApp(MyApp());
}