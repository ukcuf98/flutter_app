import 'package:flutter/material.dart';

void main(){
  /** hello world */
//  runApp(
//    Center(
//      child: Text(
//        "Your soul is mine!",
//        textDirection: TextDirection.ltr,
//      ),
//    ),
//  );
  /** 基础widget */
  // runApp(MaterialApp(
  //   title: "Example",
  //   home: MyScaffold(),
  // ));
  // /** 使用material组件+处理手势 */
  // runApp(
  //   MaterialApp(
  //     title: "使用material组件",
  //     home: TutorialHome(),
  //   )
  // );
  ///根据用户输入改变widget
  ///counter->counterDisplay+counterIncrementor
  // runApp(
  //     MaterialApp(
  //       title: "根据用户输入改变widget",
  //       home: Scaffold(
  //         appBar: AppBar(
  //           title: Text("测试add"),
  //         ),
  //         body: Counter(),
  //       ),
  //     )
  // );
  ///整合在一起-购物模拟
  runApp(
      MaterialApp(
        title: "根据用户输入改变widget",
        home: ShoppingList(products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],),
      )
  );



}

class MyAppBar extends StatelessWidget {
  final Widget title;
  MyAppBar({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),// child后的装饰
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Navigation Menu",
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "search",
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              "Example Title",
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Hello World"),
            ),
          )
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Tutorial"),
        leading: IconButton(
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "actions",
              onPressed: null
          )
        ],
      ),
      body: Center(
        // child: Column(
        //   /// 手势监测
        //   children:[
        //     Text(
        //         "Hello World"
        //     ),
        //     MyButton()
        //   ]
        // ),
        child: Text(
            "Hello World"
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "add",
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
/// 手势
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("mybutton was tapped");
      },
      child: Container(
        height: 136.0,
        padding: const EdgeInsets.all(18.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: Text("engage"),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  _increment(){
    setState(() {
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ///拆分前
        // RaisedButton(
        //   child: Text("increment"),
        //   onPressed: _increment,
        // ),
        // Text("$_count")
        ///拆分后
        CounterIncrement(
          onPressed: _increment,
        ),
        CounterDisplay(
          count: _count,
        )
      ],
    );
  }
}

class CounterIncrement extends StatelessWidget {
  final VoidCallback onPressed;
  CounterIncrement({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("increment"),
      onPressed: onPressed,
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;
  CounterDisplay({this.count});
  @override
  Widget build(BuildContext context) {
    return Text("$count");
  }
}

class Product{
  final String name;
  Product({this.name});
}

typedef void CartChangedCallback(Product product,bool inCart);

class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool incart;
  final CartChangedCallback onCartChanged;

  ShoppingListItem({this.product, this.incart, this.onCartChanged}) : super(key: ObjectKey(product));

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onCartChanged(product,incart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(
          product.name
        ),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context){
    if(!incart){
      return null;
    }
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  Color _getColor(BuildContext context){
    if(incart){
      return Colors.black54;
    }else{
      return Theme.of(context).primaryColor;
    }
  }
}

class ShoppingList extends StatefulWidget {
  final List<Product> products;

  ShoppingList({Key key, this.products}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCartSet = Set();

  _handleCartChanged(Product product,bool incart){
    setState(() {
      if(!incart){
        _shoppingCartSet.add(product);
      }else{
        _shoppingCartSet.remove(product);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
      ),
      body: ListView(
        children: widget.products.map((product){
          return ShoppingListItem(
            product: product,
            incart: _shoppingCartSet.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}








