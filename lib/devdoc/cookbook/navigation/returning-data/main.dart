import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      title: "returning-data",
      home: HomeScreen(),
    )
  );
}

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("returning-data"),
      ),
      body: Center(
        child: SelectionButton()
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  _pressBtn(BuildContext context) async{
    String result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)=>SelectionScreen()
        )
    );
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text("$result"),
      ));
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        _pressBtn(context);
      },
      child: Text("Pick an option, any option!"),
    );
  }
}


class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pick an option"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,"yes");
                },
                child: Text("yes"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pop(context,"no");
                },
                child: Text("no"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

