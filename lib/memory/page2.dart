import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

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
                Container(//大图
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 300),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page2/1.jpg'),
                      height: 230,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                  child: Center(
                      child: Image(
                        image: AssetImage('assets/memory/page2/2.png'),
                        height: 150,
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 260, 260, 0),
                  child: Center(
                      child: Image.network(//折线
                        "http://ddiy.36588.com.cn/image/mong/1/d149b32f-f9da-417f-9913-14b2731d9243.png",
                        height: 100,
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(300, 0, 0, 500),
                  child: Center(
                    child: Opacity(
                        opacity: 0.4,
                        child: Image.network(//右上角黄色圆形
                          "http://ddiy.36588.com.cn/image/mong/1/MXYZ-9410C59F8D364A738123524A87E778AC.png",
                          width: 45,
                          height: 45,
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 230, 440),
                  child: Center(
                    child: Opacity(
                        opacity: 0.4,
                        child: Image.network(//左上角淡棕色圆形
                          "http://ddiy.36588.com.cn/image/mong/1/MXYZ-4AF735A591DB492A91EC05CCE05422B1.png",
                          width: 50,
                          height: 50,
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 100, 440),
                  child: Center(
                      child: Image.network(//02正方形
                        "http://ddiy.36588.com.cn/image/mong/1/ad7c04d7-fc84-469a-bfe9-652475eb9ec0.png",
                        width: 40,
                        height: 40,
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(320, 0, 0, 352),
                  child: Center(
                      child: Image.network(//右侧垂直排列的字
                          "http://ddiy.36588.com.cn/image/mong/1/8ab7f407-09d3-4dec-8524-810af5927113.png",
                          width: 180,
                          height: 180,
                          scale: 0.1
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 220, 352),
                  child: Center(
                      child: Image.network(//左侧垂直排列的字
                          "http://ddiy.36588.com.cn/image/mong/1/77f56b07-dfbf-42df-9fe8-8997b5afe0df.png",
                          width: 100,
                          height: 100,
                          scale: 0.1
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 210, 275),
                  child: Center(
                    child: Opacity(
                        opacity: 0.4,
                        child: Image.network(//右上角黄色圆形
                          "http://ddiy.36588.com.cn/image/mong/1/MXYZ-9410C59F8D364A738123524A87E778AC.png",
                          height: 30,
                        )
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 560, 0, 0),
                  child: Center(
                    child: Text("第01页"),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}