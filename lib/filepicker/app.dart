import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FilePickerDemo (),
    );
  }
}

class FilePickerDemo extends StatefulWidget {
  @override
  _FilePickerDemoState createState() => new _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _fileName;
  String _directoryPath;
  List<PlatformFile> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = new TextEditingController();
  String content;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

 Future requestPermission() async {

   // 申请权限
   Map<Permission, PermissionStatus> permissions =
     await [Permission.storage].request();

   // 申请结果
   PermissionStatus permission = await Permission.storage.status;
   if (permission == PermissionStatus.granted) {
     print("通过");
   } else {
     print("拒绝");
   }
 }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
        _directoryPath = null;
        _paths  = (await FilePicker.platform.pickFiles(
            type: _pickingType,
            allowMultiple: _multiPick,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '')?.split(',')
                : null)
        )?.files;
        _directoryPath = _paths[0].path;
//      //新建文件
//      // 获取文档目录的路径
//      _saveTestFile();
//      _readTestFileContent();

    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    var status = await Permission.storage.status;
    print(status);
    String fileContent = await getFile(_directoryPath);
    print(fileContent.substring(100));
    
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _directoryPath != null
          ? _directoryPath.split('/').last
          : _paths != null ? _paths.map((e) => e.name).toString() : '...';
      content = fileContent;
    });
  }

  Future<String> getFile (String filePath) async{
    File file = new File(filePath);
    file.openRead();
    // 从文件中读取变量作为字符串，一次全部读完存在内存里面
    String contents = await file.readAsString();
    return contents;
  }

  Future<File> _getTestFile() async {
    // 获取文档目录的路径
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dir = appDocDir.path;
    print(dir);
    final file = new File('$dir/demo.txt');
    // print(file);
    return file;
  }

  /**
   * 保存value到本地文件里面
   */
  void _saveTestFile() async {
    try {
      File f = await _getTestFile();
      IOSink slink = f.openWrite(mode: FileMode.append);
      slink.write('abc');
      slink.close();
    } catch (e) {
      // 写入错误
      print(e);
    }
  }

  /**
   * 读取本地文件的内容
   */
  void _readTestFileContent() async {
    File file = await _getTestFile();
    // 从文件中读取变量作为字符串，一次全部读完存在内存里面
    String contents = await file.readAsString();
    print(contents);
  }



  void _clearCachedFiles() {
    FilePicker.platform.clearTemporaryFiles().then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: result ? Colors.green : Colors.red,
          content: Text((result
              ? 'Temporary files removed with success.'
              : 'Failed to clean temporary files')),
        ),
      );
    });
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        key: _scaffoldKey,
        appBar: new AppBar(
          title: const Text('File Picker example app'),
        ),
        body: new Center(
            child: new Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: new SingleChildScrollView(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new DropdownButton(
                          hint: new Text('LOAD PATH FROM'),
                          value: _pickingType,
                          items: <DropdownMenuItem>[
                            new DropdownMenuItem(
                              child: new Text('FROM AUDIO'),
                              value: FileType.audio,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM IMAGE'),
                              value: FileType.image,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM VIDEO'),
                              value: FileType.video,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM MEDIA'),
                              value: FileType.media,
                            ),
                            new DropdownMenuItem(
                              child: new Text('FROM ANY'),
                              value: FileType.any,
                            ),
                            new DropdownMenuItem(
                              child: new Text('CUSTOM FORMAT'),
                              value: FileType.custom,
                            ),
                          ],
                          onChanged: (value) => setState(() {
                            _pickingType = value;
                            if (_pickingType != FileType.custom) {
                              _controller.text = _extension = '';
                            }
                          })),
                    ),
                    new ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 100.0),
                      child: _pickingType == FileType.custom
                          ? new TextFormField(
                        maxLength: 15,
                        autovalidateMode: AutovalidateMode.always,
                        controller: _controller,
                        decoration:
                        InputDecoration(labelText: 'File extension'),
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.none,
                      )
                          : const SizedBox(),
                    ),
                    new ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 200.0),
                      child: new SwitchListTile.adaptive(
                        title: new Text('Pick multiple files',
                            textAlign: TextAlign.right),
                        onChanged: (bool value) =>
                            setState(() => _multiPick = value),
                        value: _multiPick,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: Column(
                        children: <Widget>[
                          new ElevatedButton(
                            onPressed: () => _openFileExplorer(),
                            child: new Text("Open file picker"),
                          ),
                          new ElevatedButton(
                            onPressed: () => _selectFolder(),
                            child: new Text("Pick folder"),
                          ),
                          new ElevatedButton(
                            onPressed: () => _clearCachedFiles(),
                            child: new Text("Clear temporary files"),
                          ),
                        ],
                      ),
                    ),
                    new Builder(
                      builder: (BuildContext context) => _loadingPath
                          ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                          : _directoryPath != null?ListTile(
                        title: const Text("Directory path"),
                        subtitle: Text(_directoryPath),
                      ) : _paths != null
                          ? new Container(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: new Scrollbar(
                            child: new ListView.separated(
                              itemCount: _paths != null && _paths.isNotEmpty
                                  ? _paths.length
                                  : 1,
                              itemBuilder: (BuildContext context, int index) {
                                final bool isMultiPath =
                                    _paths != null && _paths.isNotEmpty;
                                final String name = 'File $index: ' +
                                    (isMultiPath
                                        ? _paths.map((e) => e.name).toList()[index]
                                        : _fileName ?? '...');
                                final path = _paths
                                    .map((e) => e.name).toList()[index].toString();

                                return new ListTile(
                                  title: new Text(
                                    name,
                                  ),
                                  subtitle: new Text(path),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                              new Divider(),
                            )),
                      )
                          : new Container(),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}