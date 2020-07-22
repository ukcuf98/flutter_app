import 'package:flutter/material.dart';
import 'package:flutterapp/fclock/constants.dart';

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
              boxShadow: [
                BoxShadow(
//                  color: Colors.grey[300],
                  color: Colors.green,
                  offset: Offset(4.0,4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.5
                ),
                BoxShadow(
//                    color: Color(darkSilver),
                    color: Colors.red,
                    offset: Offset(-4.0,-4.0),
                    blurRadius: 5.0,
                    spreadRadius: 0.5
                )
              ]
            ),
          ),
        )
      ],
    );
  }
}
