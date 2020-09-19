import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  // debugPaintSizeEnabled = true;
  // ///row column布局
  // runApp(MaterialApp(
  //   title: "layout",
  //   home: RowColumnExample(),
  // ));
  // ///嵌套行和列
  // ///官方示例适合平板
  // ///当前代码与官方示例相比，去掉了右侧图片部分，差别不大
  // runApp(MaterialApp(
  //   title: "Pavlova",
  //   home: Pavlova(),
  // ));
  // runApp(MaterialApp(
  //   title: "Pavlova",
  //   home: StackExample(),
  // ));
  runApp(MaterialApp(
    title: "Pavlova",
    home: CardExample(),
  ));
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
        child: buildExpandedColumn(),
        // child: buildExpandedRow(),
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
          child: Image.asset("assets/devdoc/layout/pic1.jpg"),
        ),
        Expanded(
          flex: 3,
          child: Image.asset("assets/devdoc/layout/pic2.jpg"),
        ),
        Expanded(
          child: Image.asset("assets/devdoc/layout/pic3.jpg"),
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
        child: Card(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                title,
                subTitle,
                starsRow,
                iconList
              ],
            ),
          ),
        )
      ),
    );
  }

  var title = Container(
    padding: EdgeInsets.all(20),
    child: Text(
      "Strawberry Pavlova",
      style: TextStyle(
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,//字间距
        fontSize: 30
      ),
    ),
  );

  var subTitle = Text(
    "Pavlova is a meringue-based dessert named after the Russian ballerina "
    "Anna Pavlova. Pavlova features a crisp crust and soft, light inside, "
    "topped with fruit and whipped cream.",
    textAlign: TextAlign.center,
    style: TextStyle(
      fontFamily: "Georgia",
      fontSize: 20
    ),
  );

  var starsRow = Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star,
              color: Colors.green[500],
            ),
            Icon(
              Icons.star,
              color: Colors.green[500],
            ),
            Icon(
              Icons.star,
              color: Colors.green[500],
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
            Icon(
              Icons.star,
              color: Colors.black,
            ),
          ],
        ),
        Text(
          "170 Reviews",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w800,
            fontFamily: "Roboto",
            letterSpacing: 0.5,
            fontSize: 20
          ),
        )
      ],
    ),
  );

  // final descTextStyle = TextStyle(
  //   color: Colors.black,
  //   fontWeight: FontWeight.w800,
  //   fontFamily: "Roboto",
  //   letterSpacing: 0.5,
  //   fontSize: 18,
  //   height: 2
  // );

  var iconList = DefaultTextStyle.merge(
    style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: "Roboto",
        letterSpacing: 0.5,
        fontSize: 18,
        height: 2
    ),
    child: Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.kitchen,color: Colors.green[500],),
              Text("PREP:"),
              Text("25 min")
            ],
          ),
          Column(
            children: [
              Icon(Icons.timer,color: Colors.green[500],),
              Text("COOK:"),
              Text("1 hr")
            ],
          ),
          Column(
            children: [
              Icon(Icons.restaurant,color: Colors.green[500],),
              Text("FEEDS:"),
              Text("4-6")
            ],
          ),
        ],
      ),
    )
  );

}

///stack示例
class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stack"),
      ),
      body: Container(
        child: Stack(
          alignment: Alignment(0.6,0.6),
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/devdoc/layout/pic.jpg"),
              radius: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                "Mia B",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

///card示例
class CardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(//地址
              title: Text(
                "1625 Main Street",
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
              ),
              subtitle: Text("My City, CA 99984"),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            Divider(),
            ListTile(//电话
              title: Text(
                "(408) 555-1212",
                style: TextStyle(
                    fontWeight: FontWeight.w500
                ),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(//电话
              title: Text(
                "costa@example.com",
                style: TextStyle(
                    fontWeight: FontWeight.w500
                ),
              ),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



