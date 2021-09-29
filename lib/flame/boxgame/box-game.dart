// import 'dart:ui';
// import 'package:flame/game.dart';
// import 'package:flutter/gestures.dart';
//
// class BoxGame extends Game{
//   Size screenSize;
//   bool hasWon = false;
//
//   @override
//   void render(Canvas canvas) {
//     Rect bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
//     Paint bgPaint = Paint();
//     bgPaint.color = Color(0xff000000);
//     canvas.drawRect(bgRect, bgPaint);
//
//     double screenCenterX = screenSize.width/2;
//     double screenCenterY = screenSize.height/2;
//     Rect boxRect = Rect.fromLTWH(screenCenterX-75, screenCenterY-75, 150, 150);
//     Paint boxPaint = Paint();
//     if(hasWon){
//       boxPaint.color = Color(0xff00ff00);
//     }else{
//       boxPaint.color = Color(0xffffffff);
//     }
//
//   }
//
//   @override
//   void update(double t) {
//
//   }
//
//   void resize(Size size){
//     screenSize = size;
//     super.resize(size);
//   }
//
//   void onTapDown(TapDownDetails d){
//     double screenCenterX = screenSize.width/2;
//     double screenCenterY = screenSize.height/2;
//     if(d.globalPosition.dx >= screenCenterX - 75
//       && d.globalPosition.dx >= screenCenterX + 75
//       && d.globalPosition.dy >= screenCenterY - 75
//       && d.globalPosition.dy >= screenCenterY + 75
//     ){
//       hasWon = true;
//     }
//   }
//
// }