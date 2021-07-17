import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "memory",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: AppBar(
          // title: Text("回忆录"),
        ),
        body: new SlidePage(),
      )
    );
//    return new MyJuejinPage();//调用这个会导致层级问题，还不清楚原因，定义大小？
  }
}

class SlidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Container(
      child: PageView(
        scrollDirection: Axis.vertical,
        controller: controller,
        children: [
          Page1(),
          Page2(),
          Page3()
          // Text("1",
          //     textAlign:TextAlign.center),
          // Text("2",
          //     textAlign:TextAlign.center),
          // Text("3",
          //     textAlign:TextAlign.center)
        ],
      ),
    );
  }
}

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
              Container(
                // color: Colors,
                child: Center(
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: NetworkImage("http://ddiy.36588.com.cn/image/mong/1/rsf2105087254F5702FB546D8B6F16CEDA914B9F7.jpg"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 370, 0, 0),
                // color: Colors,
                child: Center(
                  child: Text("朝暮与年岁并往 与你一起共至光年")
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 290, 280, 0),
                child: Center(
                    child: Image.network(//折线
                        "http://ddiy.36588.com.cn/image/mong/1/d149b32f-f9da-417f-9913-14b2731d9243.png",
                      width: 70,
                      height: 90,
                    )
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(300, 0, 0, 500),
                // color: Colors,
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
                // color: Colors,
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
                // color: Colors,
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
                // color: Colors,
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
                padding: EdgeInsets.fromLTRB(320, 0, 0, 352),
                // color: Colors,
                child: Center(
                    child: Image.network(//右侧垂直排列的字
                        "http://ddiy.36588.com.cn/image/mong/1/8ab7f407-09d3-4dec-8524-810af5927113.png",
                        width: 180,
                        height: 180,
                        scale: 0.1
                    )
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[300],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[300],
    );
  }
}


