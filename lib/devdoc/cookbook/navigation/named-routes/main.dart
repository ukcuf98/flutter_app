import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "named-routes",
      initialRoute: "/second",
      routes: {
        "/":(context)=>FirstRoute(),
        "/second":(context)=>SencondRoute()
      },
    )
  );
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FirstRoute"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, "/second");
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
        title: Text("SencondRoute"),
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
