import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "memory",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
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

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[200],
      height: 500.0,
      alignment: Alignment.center,
      child: Text("1"),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[300],
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


