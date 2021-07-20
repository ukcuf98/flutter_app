import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "memory",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: AppBar(
          // title: Text("回忆录"),
        ),
        body: new SlidePage(),
      )
    );
//    return new MyJuejinPage();//调用这个会导致层级问题，还不清楚原因，定义大小？
  }
}

class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Container(
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          Page1(),
          Page2(),
          Page3()
          // Text("1",
          //     textAlign:TextAlign.center),
          // Text("2",
          //     textAlign:TextAlign.center),
          // Text("3",
          //     textAlign:TextAlign.center)
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
    );
  }
}


