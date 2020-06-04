import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "randomWordTitle",
        theme: new ThemeData(primarySwatch: Colors.blue),
        home: new RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomwordState();
  }
}

class RandomwordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _rowFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("title"),
        actions: [
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        final tiles = _saved.map((pair) {
          return new ListTile(
            title: new Text(
              pair.asPascalCase,
              style: _rowFont,
            ),
          );
        });
        final divided =
            ListTile.divideTiles(context: context, tiles: tiles).toList();
        return new Scaffold(
          appBar: new AppBar(
            title: new Text("route"),
          ),
          body: new ListView(
            children: divided,
          ),
        );
      }),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) {
        return new Divider();
      }
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair wordPair) {
    final savedFlag = _saved.contains(wordPair);
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _rowFont,
      ),
      trailing: new Icon(
        savedFlag ? Icons.favorite : Icons.favorite_border,
        color: savedFlag ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (savedFlag) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
