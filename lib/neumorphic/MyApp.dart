import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      title: '新拟态',
      theme: NeumorphicThemeData(
        borderColor: Colors.black
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
      appBar: NeumorphicAppBar(
        title: Text('新拟态'),
        centerTitle: true,
        leading: NeumorphicIcon(
          Icons.add_circle,
          style: NeumorphicStyle(
            color: Colors.white60,
            lightSource: LightSource.topLeft
          ),
          size: 50,
        ),
        actions: [
          Text('action1'),
        ],
      ),
      body: Container(
        width: 400,
        alignment: Alignment.center,
        padding:EdgeInsets.fromLTRB(10,100,10,10),
        color: Colors.white54,
        child: Column(
          children: [
            Neumorphic(
              style: NeumorphicStyle(
                color: Colors.white,
                boxShape: NeumorphicBoxShape.rect(),
              ),
              child: NeumorphicText(
                'Flutter',
                style: NeumorphicStyle(
                    depth: 5,
                    color: Colors.white,
                    lightSource: LightSource.bottomRight
                ),
                textStyle: NeumorphicTextStyle(
                    fontSize: 100
                ),
              ),
            ),
            NeumorphicSwitch(
              value: true,
              onChanged: (flag){
                return !flag;
              },
            ),
            NeumorphicButton(
              child: Text(
                '测试1'
              ),
              pressed: false,
              onPressed: (){
                print('测试1:别按我');
              },
            ),
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

