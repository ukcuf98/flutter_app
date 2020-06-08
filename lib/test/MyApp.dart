import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test app",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: "test title"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int _count = 0;
  int _start = 0;
  int _end = 0;
  int _pressedTime = 0;
  double _resultTime;

  _increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("appbar title"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text("press times"),
            new Text("$_count"),
            new MaterialButton(
              child: new Text("1秒挑战"),
              onPressed: _pressVoid,
              onHighlightChanged: (high) {
                _pressTimeCount(high);
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "press",
        onPressed: _increment,
        child: new Icon(Icons.add),
      ),
    );
  }

  _pressVoid() {}

  /**
   * 计算按屏幕的时间
   */
  bool _pressTimeCount(bool high) {
    setState(() {
//      print(high);
      if (high) {//按钮按下high为true，松开为false
        _start = new DateTime.now().millisecondsSinceEpoch;//取当前时间的毫秒数
//        print("$_start");
      } else {
        _end = new DateTime.now().millisecondsSinceEpoch;
        _pressedTime = _end - _start;
        _resultTime = _pressedTime/1000;
//        print("$_end减$_start=$_pressedTime");
        _openAlertDialog();
      }
    });
  }

  /**
   * 弹框提示
   */
  _openAlertDialog() {
    final action = showDialog(
      context: context,
      barrierDismissible: false, // 若设置为false用户不能点击空白部分来关闭对话框
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(getResultStr(_pressedTime)),
          content: Text("你的成绩是$_resultTime秒"),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      }
    );
  }

  /**
   * 根据时间展示不同提示语
   */
  String getResultStr(int time){
    if(time<200){
      return "手速超越光速";
    }
    if(time<700){
      return "用点力";
    }
    if(time<900){
      return "哦。你开始认真了";
    }
    if(time>900 && time <=990){
      return "加油，希望就在眼前";
    }
    if(time<1000){
      return "就差那。。。。么一点点了";
    }
    if(time==1000){
      return "你真是个天才";
    }
    if(time>1000){
      return "GKD，别浪费时间";
    }
  }
}
