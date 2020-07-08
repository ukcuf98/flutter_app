import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test app",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(),
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget列表"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("container"),
            onTap: (){
              Navigator.of(context).pushNamed("");
            },
          )
        ],
      ),
    );
  }
}
