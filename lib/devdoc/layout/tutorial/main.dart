import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: "布局构建教程",
    home: Tutorial(),
  ));
}

class Tutorial extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    ///标题行
    ///观察界面布局，根据层级进行拆解
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Oeschinen Lake Campground",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "Kandersteg, Switzerland",
                  style: TextStyle(
                      color: Colors.grey[500]
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text("41")
        ],
      ),
    );
    ///拆分后的组件是否有共性，判断是否可以提取方法，方便调用
    ///图标列公用方法
    Widget _buildIconColumnItem(Color color,IconData iconData,String label){
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: color,
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: color
              ),
            ),
          )
        ],
      );
    }
    ///图标行
    Widget iconSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildIconColumnItem(color, Icons.phone, "CALL"),
          _buildIconColumnItem(color, Icons.near_me, "ROUTE"),
          _buildIconColumnItem(color, Icons.share, "SHARE"),
        ],
      ),
    );
    ///文本行
    Widget contentSection = Container(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("我在东北玩泥巴"),
      ),
      body: ListView(
          children: [
            Image.asset(
              "assets/devdoc/layout/tutorial/lake.jpg",
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            iconSection,
            contentSection
          ],
        ),
    );
  }
}





