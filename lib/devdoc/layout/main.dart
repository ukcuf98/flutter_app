import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  debugPaintSizeEnabled = true;
  ///row column布局
  runApp(MaterialApp(
    title: "layout",
    home: RowColumnExample(),
  ));
  ///嵌套行和列

}

class RowColumnExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rowExample"),
      ),
      body: Center(
        // child: buildRow(),
        // child: buildColumn(),
        // child: buildExpandedColumn(),
        child: buildExpandedRow(),
      ),
    );
  }
  Widget buildRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/devdoc/layout/pic1.jpg",height: 100),
        Image.asset("assets/devdoc/layout/pic2.jpg",height: 100),
        Image.asset("assets/devdoc/layout/pic3.jpg",height: 100),
      ],
    );
  }

  Widget buildColumn(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/devdoc/layout/pic1.jpg",height: 100),
        Image.asset("assets/devdoc/layout/pic2.jpg",height: 100),
        Image.asset("assets/devdoc/layout/pic3.jpg",height: 100),
      ],
    );
  }

  ///调整widget大小，图片需要设置height或width
  ///row和column使用Expanded时设置height或width不同，设置错误大小对比不生效
  Widget buildExpandedRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image.asset("assets/devdoc/layout/pic1.jpg",width: 100),
        ),
        Expanded(
          flex: 2,
          child: Image.asset("assets/devdoc/layout/pic2.jpg",width: 100),
        ),
        Expanded(
          child: Image.asset("assets/devdoc/layout/pic3.jpg",width: 100),
        ),
      ],
    );
  }

  Widget buildExpandedColumn(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image.asset("assets/devdoc/layout/pic1.jpg",height: 100),
        ),
        Expanded(
          flex: 2,
          child: Image.asset("assets/devdoc/layout/pic2.jpg",height: 100),
        ),
        Expanded(
          child: Image.asset("assets/devdoc/layout/pic3.jpg",height: 100),
        ),
      ],
    );
  }
}

///蛋糕图片布局实现
class Pavlova extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pavlova"),
      ),
      body: Center(
        child: Container(
          
        ),
      ),
    );
  }
}

