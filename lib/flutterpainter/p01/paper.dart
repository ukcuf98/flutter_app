import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {

  @override
  void initState(){
    super.initState();
  }

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
  Paint _paint;
  Path _path;
  PaperPainter(){
    _paint = Paint()
      ..color = Colors.blue
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke;
    _path = Path();
  }

  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    canvas.drawLine(Offset(0, 0), Offset(100, 100), _paint);
    _path.moveTo(100, 100);
    _path.lineTo(200, 0);
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
