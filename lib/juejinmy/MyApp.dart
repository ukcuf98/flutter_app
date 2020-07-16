import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test app",
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Scaffold(
        appBar: AppBar(
          title: Text("我"),
          centerTitle: true,
        ),
        body: new MyJuejinPage(),
      )
    );
//    return new MyJuejinPage();//调用这个会导致层级问题，还不清楚原因，定义大小？
  }
}

class MyJuejinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _RowItem(
          iconData:Icons.notifications,
          iconColor:Colors.blue,
          title: "消息中心",
          suffix: _NotificationText(
            text: "2",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.thumb_up,
          iconColor:Colors.green,
          title: "我赞过的",
          suffix: _NormalText(
            text: "121篇",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.grade,
          iconColor:Colors.yellow,
          title: "收藏集",
          suffix: _NormalText(
            text: "7个",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.shopping_basket,
          iconColor:Colors.yellow,
          title: "已购小册",
          suffix: _NormalText(
            text: "10个",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.account_balance_wallet,
          iconColor:Colors.blue,
          title: "我的钱包",
          suffix: _NormalText(
            text: "998",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.history,
          iconColor:Colors.grey,
          title: "阅读过的文章",
          suffix: _NormalText(
            text: "1024篇",
          ),
        ),
        Divider(),
        _RowItem(
          iconData:Icons.local_offer,
          iconColor:Colors.grey,
          title: "标签管理",
          suffix: _NormalText(
            text: "13个",
          ),
        ),
      ],
    );
  }
}



/// 每一行差不多，通知这一项后缀的文本比较特别 可以单独定义
class _NotificationText extends StatelessWidget {
  final String text;
  const _NotificationText({Key key,this.text}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,//长方形
        borderRadius: BorderRadius.all(Radius.circular(50)),//边框弧度
        color: Colors.red
      ),
      child: Text(
        "$text",
        style: TextStyle(
          color: Colors.white
        ),
      ),
    );
  }
}
/// 普通后缀文本
class _NormalText extends StatelessWidget {
  final String text;
  const _NormalText({Key key,this.text}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        color: Colors.grey.withOpacity(.5)
      ),
    );
  }
}


class _RowItem extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String title;
  final Widget suffix;

  const _RowItem ({Key key,this.iconData,this.iconColor,this.title,this.suffix}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Icon(iconData,color: iconColor),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Text("$title"),
          ),
          suffix,
          SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}

