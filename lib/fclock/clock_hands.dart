import 'package:flutter/material.dart';
import 'dart:math';
import 'package:vector_math/vector_math_64.dart' as Vector;

class ClockHands extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    ///下面两行代码表示坐标系旋转
    ///如果旋转则影响下面坐标的计算方式可以参考源代码
    ///自己研究计算方式后,未使用原计算方式，导致以下 x,y计算方式也不同
//    var angle = Vector.radians(90);
//    canvas.rotate(angle);
    final paint = Paint()..strokeCap=StrokeCap.round;//画笔形状
    // width height都为0
//    double width = size.width;
//    double height = size.height;
//    print("$width---$height");
    var center = Offset((size.width)/2, (size.height)/2);
    //画时钟的秒针
    final p1_sec = center;
    //秒针角度计算
    double degree_sec = 360/60*DateTime.now().second;
    double r_sec = 115;
    //坐标系不变的话，需要根据对应角度设置坐标，
    //坐标计算
    double x_sec = r_sec*sin(Vector.radians(degree_sec));
    double y_sec = -r_sec*cos(Vector.radians(degree_sec));
//    print("$x---$y");
    final p2_sec = Offset(x_sec, y_sec);
    paint.color = Colors.red;
    paint.strokeWidth=4;
    canvas.drawLine(p1_sec, p2_sec, paint);
    //画时钟的分针
    final p1_min = center;
    double degree_min = 360/60*DateTime.now().minute;
    double r_min = 100;
    double x_min = r_min*sin(Vector.radians(degree_min));
    double y_min = -r_min*cos(Vector.radians(degree_min));
    final p2_min = Offset(x_min,y_min);
    paint.color = Colors.purple;
    paint.strokeWidth=6;
    canvas.drawLine(p1_min, p2_min, paint);
    //画时钟的时针
    final p1_hour = center;
    double degree_hour = 360/12*DateTime.now().hour;
    double r_hour = 75;
    double x_hour = r_hour*sin(Vector.radians(degree_hour));
    double y_hour = -r_hour*cos(Vector.radians(degree_hour));
    final p2_hour = Offset(x_hour,y_hour);
    paint.color = Colors.yellow;
    paint.strokeWidth=6;
    canvas.drawLine(p1_hour, p2_hour, paint);

    //时钟刻度 需要按60份计算(60分钟)
    for(int i=0;i<60;i++){
      double minute = 360/60*i;
      paint.color = (i%15==0)?Colors.black54:Colors.grey;
      paint.strokeWidth = (i%15==0)?4:1;
      double r_small = 118;
      double x1 = r_small*sin(Vector.radians(minute));
      double y1 = -r_small*cos(Vector.radians(minute));
      final p1 = Offset(x1,y1);

      double r_big = 123;
      double x2 = r_big*sin(Vector.radians(minute));
      double y2 = -r_big*cos(Vector.radians(minute));
      final p2 = Offset(x2,y2);
      //画刻度
      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}