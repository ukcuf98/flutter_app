import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test app",
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new MyHomePage(title: "test title"),
    );
  }

}

class MyHomePage extends StatefulWidget{
  final String title;
  MyHomePage({Key key,this.title}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return new MyHomePageState();
  }

}

class MyHomePageState extends State<MyHomePage>{
  int _count=0;
  _increment(){
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
            new Text("$_count")
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

}