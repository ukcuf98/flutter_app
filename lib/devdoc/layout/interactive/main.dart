import 'package:flutter/material.dart';
///复制之前的代码，调整星号图标部分
void main(){
  // runApp(MaterialApp(
  //   title: "布局构建教程",
  //   home: Tutorial(),
  // ));
  // runApp(MaterialApp(
  //   title: "布局构建教程",
  //   home: Scaffold(
  //     appBar: AppBar(
  //       title: Text("TapBoxA"),
  //     ),
  //     body: TapBoxA(),
  //   ),
  // ));

  // runApp(MaterialApp(
  //   title: "布局构建教程",
  //   home: Scaffold(
  //     appBar: AppBar(
  //       title: Text("TapBoxB"),
  //     ),
  //     body: ParentWidget(),
  //   ),
  // ));

  ///点击更改文字和背景颜色
  ///parent传参数控制文字，
  runApp(MaterialApp(
    title: "布局构建教程",
    home: Scaffold(
      appBar: AppBar(
        title: Text("TapBoxC"),
      ),
      body: ParentCWidget(),
    ),
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
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // Text("41")
          FavoriteWidget()
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

///需要更新的部件提取出单独的widget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  _pressFavorite(){
    setState(() {
      if(_isFavorited){
        _isFavorited = false;
        _favoriteCount = _favoriteCount-1;
      }else{
        _isFavorited = true;
        _favoriteCount = _favoriteCount+1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited?Icon(Icons.star):Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _pressFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Text(
            "$_favoriteCount"
          ),
        )
      ],
    );
  }
}

///自己管理状态
class TapBoxA extends StatefulWidget {
  @override
  _TapBoxAState createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA> {
  bool _active = false;

  void _tap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tap,
      child: Container(
        child: Center(
          child: Text(
            _active?"Active":"Inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }
}
///parent管理,需要parent传参数到child
///状态，数据更新的方法在parent里定义
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapBoxChanged(bool newvalue){
    setState(() {
      _active = newvalue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;
  TapBoxB({Key key,this.active:false,@required this.onChanged}):super(key:key);

  _handelChange(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handelChange,
      child: Container(
        child: Center(
          child: Text(
            active?"Active":"Inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active?Colors.lightGreen[700]:Colors.grey,
        ),
      ),
    );
  }
}

class ParentCWidget extends StatefulWidget {
  @override
  _ParentCWidgetState createState() => _ParentCWidgetState();
}

class _ParentCWidgetState extends State<ParentCWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(
        active: _active,
        onChange: _handleTapBoxChanged,
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChange;
  TapBoxC({Key key,this.active:false,this.onChange}):super(key:key);

  @override
  _TapBoxCState createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTap(){
    widget.onChange(!widget.active);
  }
  void _handleTapDown(TapDownDetails tapDownDetails){
    _highlight = true;
  }
  void _handleTapUp(TapUpDetails tapUpDetails){
    _highlight = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      child: Container(
        child: Center(
          child: Text(
            widget.active?"active":"inactive",
            style: TextStyle(
              fontSize: 32,
              color: Colors.white
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: widget.active?Colors.lightGreen[700]:Colors.grey[600],
          border: _highlight?Border.all(
            color: Colors.teal[700],
            width: 10
          ):null,
        ),
      ),
    );
  }
}













