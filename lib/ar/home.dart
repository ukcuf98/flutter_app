//import 'package:arcore_flutter_plugin_example/screens/augmented_faces.dart';
//import 'package:arcore_flutter_plugin_example/screens/augmented_images.dart';
//import 'package:arcore_flutter_plugin_example/screens/matri_3d.dart';
import 'package:flutter/material.dart';
import 'screens/hello_world.dart';
//import 'screens/custom_object.dart';
//import 'screens/runtime_materials.dart';
//import 'screens/texture_and_rotation.dart';
//import 'screens/assets_object.dart';
//import 'screens/auto_detect_plane.dart';
//import 'screens/remote_object.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArCore Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HelloWorld()));
            },
            title: Text("Hello World"),
          )
        ],
      ),
    );
  }
}