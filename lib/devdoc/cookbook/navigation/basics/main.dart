import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "Basics",
      home: FirstRoute(),
    )
  );
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FirstRoute"
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>SencondRoute()
            ));
          },
          child: Text("open route"),
        ),
      ),
    );
  }
}

class SencondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "SencondRoute"
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("close route"),
        ),
      ),
    );
  }
}
