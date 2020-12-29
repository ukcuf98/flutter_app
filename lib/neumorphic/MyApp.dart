import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '新拟态',
      theme: new ThemeData(
          primaryColor:Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _count=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新拟态'),
      ),
      body: Container(
        padding:EdgeInsets.fromLTRB(100,100,100,100),
        child: Column(
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white
              ),
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(20),
                child: Text(
                    '测试'
                ),
              ),
            ),
            Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: 8,
                  lightSource: LightSource.topLeft,
                  color: Colors.white
              ),
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                // padding: EdgeInsets.all(20),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    _count++;
                    print('$_count');
                  },
                )
              ),
            )
          ],
        ),
      ),
    );

  }
}

