import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "123",
      home: TodoScreen(
        todos: List.generate(20, (index) => Todo("Todo title $index", "Todo description $index")),
      ),
    )
  );
}

class Todo{
  final String title;
  final String description;
  Todo(this.title,this.description);
}

class TodoScreen extends StatelessWidget {
  final List<Todo> todos;
  ///构造函数，必传参数
  TodoScreen({Key key,@required this.todos}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todos"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,i){
          return ListTile(
            title: Text(todos[i].title),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                // builder: (context)=>DetailScreen(todo: todos[i])
                builder: (context)=>DetailScreen1(),
                settings: RouteSettings(
                  arguments: todos[i]
                )
              ));
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key,@required this.todo}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(todo.description),
      ),
    );
  }
}

///RouteSettings传递参数
class DetailScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(todo.description),
      ),
    );
  }
}
