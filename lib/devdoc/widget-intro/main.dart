import 'package:flutter/material.dart';

void main(){
//  runApp(
//    Center(
//      child: Text(
//        "Your soul is mine!",
//        textDirection: TextDirection.ltr,
//      ),
//    ),
//  );
  runApp(MaterialApp(
    title: "Example",
    home: MyScaffold(),
  ));
}

class MyAppBar extends StatelessWidget {
  final Widget title;
  MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),// child后的装饰
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation Menu",
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "search",
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              "Example Title",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello World"),
            ),
          )
        ],
      ),
    );
  }
}

