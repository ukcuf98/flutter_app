import 'package:flutter/material.dart';

/**
 * 对应 Widget框架总览
 * https://flutterchina.club/widgets-intro/
 */
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "框架总览",
      home: new MyScaffold(),
    );
  }

}

class MyScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: [
          new MyAppbar(
            title: new Text(
                "顶部导航栏",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          new Expanded(child: new Center(
            child: new Text("center内容"),
          ))
        ],
      ),
    );
  }
}

/**
 * 自定义导航栏
 */
class MyAppbar extends StatelessWidget{
  final Widget title;
  MyAppbar({this.title});
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 66.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.red[500]),
      child: new Row(
        children: [
          new IconButton(
              icon: new Icon(Icons.menu),
              tooltip: "菜单",
              onPressed: null
          ),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "搜索",
            onPressed: null
          )
        ],
      ),
    );
  }

}