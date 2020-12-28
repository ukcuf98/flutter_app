import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "demo",
      home: DemoPage(),
    )
  );
}

class DemoPage extends StatelessWidget {
  final GlobalKey<_AnimationDemo1State> demo1Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: AnimationDemo1(key: demo1Key,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: (){
          if(!demo1Key.currentState.controller.isAnimating){
            demo1Key.currentState.controller.forward();
          }else{
            demo1Key.currentState.controller.stop();
          }
        },
      ),
    );
  }
}

class AnimationDemo1 extends StatefulWidget {

  AnimationDemo1({Key key}) : super(key:key);
  @override
  _AnimationDemo1State createState() => _AnimationDemo1State();
}

class _AnimationDemo1State extends State<AnimationDemo1> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(
        seconds: 1
      ),
      vsync: this
    );
    animation  = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticInOut,
      reverseCurve: Curves.easeOut
    );
    animation.addListener(() {
      setState(() {

      });
    });
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });
    animation =  Tween(begin: 50.0,end: 120.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: animation.value,
      ),
    );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
}

