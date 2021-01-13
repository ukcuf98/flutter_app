import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutterapp/neumorphic/lib/ThemeConfigurator.dart';
import 'package:flutterapp/neumorphic/lib/top_bar.dart';

class GalaxySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicTheme(
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFE5E5E5),
        depth: 20,
        intensity: 1,
        lightSource: LightSource.top,
      ),
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF1F1F1),
                Color(0xFFCFCFCF)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: _Page(),
        ),
      )
    );
  }
}

class _Page extends StatefulWidget {
  @override
  __PageState createState() => __PageState();
}

class __PageState extends State<_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(left: 12,right: 12,top: 10),
              child: TopBar(
                actions: [
                  ThemeConfigurator()
                ],
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _letter("G"),
                _firstBox(),
                _letter('l'),
                _secondBox(),
                _letter('x'),
                _letter('y')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _letter(String letter){
    return Text(
        letter,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 80
      ),
    );
  }

  Widget _firstBox(){
    return Neumorphic(
      margin: EdgeInsets.symmetric(horizontal: 4),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
      ),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -1,
          oppositeShadowLightSource: true,
        ),
        padding: EdgeInsets.all(2),
        child: SizedBox(
          height: 60,
          width: 40,
        ),
      ),
    );
  }

  Widget _secondBox(){
    return Padding(
      padding: const EdgeInsets.only(left: 8,right: 4),
      child: Transform.rotate(
        angle: 0.79,
        child: Neumorphic(
          style: NeumorphicStyle(
            lightSource: LightSource.topLeft,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8))
          ),
          child: Neumorphic(
            style: NeumorphicStyle(
              lightSource: LightSource.topLeft,
              oppositeShadowLightSource: true,
              depth: -1
            ),
            child: SizedBox(
              width: 50,
              height: 50,
            ),
          ),
        ),
      ),
    );
  }
}

