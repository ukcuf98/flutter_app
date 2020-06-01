import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "randomWordTitle",
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text("randomword"),
          ),
          body: new Center(
            child: new RandomWords(),
          ),
      )
    );
  }
  
}

class RandomWords extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RandomwordState();
  }

}
class RandomwordState extends State<RandomWords>{
  final wordpair = new WordPair.random();
  @override
  Widget build(BuildContext context) {
    return new Text(wordpair.asPascalCase);
  }

}