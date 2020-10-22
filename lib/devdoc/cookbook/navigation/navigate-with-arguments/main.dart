import "package:flutter/material.dart";

void main(){
  runApp(
    MaterialApp(
      title: "navigate-with-arguments",
      home: HomePage(),
      onGenerateRoute: (setting){
        ///相当于拦截每次route
        if(setting.name == PassArgumentsScreen.routeName){
          final ScreenArguments args = setting.arguments;
          return MaterialPageRoute(
            builder: (context){
              return PassArgumentsScreen(
                  title: args.title,
                  message: args.message
              );
            }
          );
        }
        assert(false,"need to implement${setting.name}");
        return null;
      },
      routes: {
        ExtractArgumentsScreen.routeName:(context)=>ExtractArgumentsScreen()
      },
    )
  );
}

class ScreenArguments{
  final String title;
  final String message;
  ScreenArguments(this.title,this.message);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("navigate-with-arguments"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments("Extract Arguments Screen", "This message is extracted in the build method.")
                );
              },
              child: Text("Navigate to screen that extracts arguments"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    PassArgumentsScreen.routeName,
                    arguments: ScreenArguments("accept arguments screen", "This message is extracted in the onGenerateRoute function.")
                );
              },
              child: Text("Navigate to a named that accepts arguments"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static String routeName = "/extractArguments";
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static String routeName = "/passArguments";
  final String title;
  final String message;
  PassArgumentsScreen({Key key,@required this.title,@required this.message}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}


