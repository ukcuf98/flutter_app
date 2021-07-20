import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffefd9c7),
      height: 500.0,
      alignment: Alignment.center,
      child: Container(
        width: 500,
        height: 680,
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
            width: 360,
            height: 600,
            decoration: BoxDecoration(
                border: RDottedLineBorder.all(
                  width: 2,
                  color: Colors.red,
                  dottedLength: 15,
                  dottedSpace: 8
                )
            ),
            child: Stack(
              children: [
                Container(//主图
                  child: Center(
                    child: CircleAvatar(
                      radius: 140,
                      backgroundImage: AssetImage(
                        'assets/memory/page1/2.jpg',
                      ),
                    ),
                  ),
                ),
                Container(//图底下的文字
                  padding: EdgeInsets.fromLTRB(20, 370, 0, 0),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page1/8.png'),
                      width: 160,
                    )
                  ),
                ),
                Container(//折线
                  padding: EdgeInsets.fromLTRB(0, 260, 260, 0),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page1/6.png'),
                      height: 100,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(300, 0, 0, 500),
                  child: Center(//右上角圆,图片资源共用
                    child: Opacity(
                      opacity: 0.4,
                      child: Image(
                        image: AssetImage('assets/memory/page1/1.png'),
                        width: 45,
                      )
                    ),
                  ),
                ),
                Container(//左上深色圆
                  padding: EdgeInsets.fromLTRB(0, 0, 230, 440),
                  child: Center(
                    child: Opacity(
                      opacity: 0.4,
                      child: Image(
                        image: AssetImage('assets/memory/page1/4.png'),
                        width: 50,
                      )
                    ),
                  ),
                ),
                Container(//02文字
                  padding: EdgeInsets.fromLTRB(0, 0, 100, 440),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page1/3.png'),
                      width: 40,
                    )
                  ),
                ),
                Container(//文字
                  padding: EdgeInsets.fromLTRB(320, 0, 0, 352),
                  child: Center(
                      child: Image(
                        image: AssetImage('assets/memory/page1/7.png'),
                        height: 180,
                      )
                  ),
                ),
                Container(//左上方竖直方向的文字
                  padding: EdgeInsets.fromLTRB(0, 0, 220, 352),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page1/5.png'),
                      height: 100,
                    )
                  ),
                ),
                Container(//左上方小圆
                  padding: EdgeInsets.fromLTRB(0, 0, 210, 275),
                  child: Center(
                    child: Opacity(
                        opacity: 0.4,
                        child: Image(
                          image: AssetImage('assets/memory/page1/1.png'),
                          width: 30,
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 560, 0, 0),
                  child: Center(
                    child: Text("封面"),
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}