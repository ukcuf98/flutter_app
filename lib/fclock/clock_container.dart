import 'package:flutter/material.dart';
import 'package:flutterapp/fclock/constants.dart';

/// 画表盘 两个圆
class ClockContainer extends StatelessWidget {
  final Widget child;
  ClockContainer({this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            width: 270,
            height: 270,
            decoration: BoxDecoration(
              color: Color(darkSilver),
              shape: BoxShape.circle,
              boxShadow: [//红绿色测试属性用，可以看出更改各参数的区别
                BoxShadow(
                  color: Colors.grey[300],
//                  color: Colors.green,
                  offset: Offset(4.0,4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5
                ),
                BoxShadow(
                    color: Color(darkSilver),
//                    color: Colors.red,
                    offset: Offset(-4.0,-4.0),
                    blurRadius: 5.0,
                    spreadRadius: 0.5
                )
              ]
            ),
          ),
        ),
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Color(silver),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  offset: Offset(4.0,4.0),
                  spreadRadius: 1.0,
                  blurRadius: 5.0
                ),
                BoxShadow(
                    color: Color(silver),
//                    color: Colors.red,
                    offset: Offset(-4.0,-4.0),
                    spreadRadius: 1.0,
                    blurRadius: 15.0
                )
              ]
            ),
          ),
        ),
        Center(
          child: this.child,
        ),
        Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(red)
            ),
          ),
        )
      ],
    );
  }
}
