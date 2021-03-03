import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PaperPainter(),
      ),
    );
  }
}

class PaperPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    drawIsAntiAliasColor(canvas);
  }

  void drawIsAntiAliasColor(Canvas canvas){
    Paint paint = Paint();
    canvas.drawCircle(
        Offset(180, 180),
        170,
        paint..color= Colors.blue
        ..strokeWidth = 5
    );

    canvas.drawCircle(
        Offset(180 + 360.0, 180),
        170,
        paint..color = Colors.red
        ..isAntiAlias = false
    );
  }

  void drawStyleStrokeWidth(Canvas canvas){

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

}
