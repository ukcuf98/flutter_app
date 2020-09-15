import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Sound extends StatefulWidget {
  final Widget child;
  const Sound({Key key,this.child}):super(key:key);

  // 作用?
  static _SoundState of(BuildContext context){
    final state = context.findAncestorStateOfType();
    assert(state != null, 'can not find Sound Widget');
    return state;
  }

  @override
  _SoundState createState() => _SoundState();

}
const _SOUNDS = [
  'clean.mp3',
  'drop.mp3',
  'explosion.mp3',
  'move.mp3',
  'rotate.mp3',
  'start.mp3'
];


class _SoundState extends State<Sound> {
  Soundpool _soundpool;
  Map<String,int> _soundIds;
  //是否静音
  bool silent = false;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void initState(){
    super.initState();
    //加载声音文件数据
    _soundpool = Soundpool(streamType: StreamType.music,maxStreams: 4);
    _soundIds = Map();
    for(var values in _SOUNDS){
      scheduleMicrotask(() async{
        final data = await rootBundle.load("assets/tetris/audio/$values");
        _soundIds[values] = await _soundpool.load(data);
      });
    }
  }

  void _play(String name){
    final soundId = _soundIds[name];
    if(null != soundId && !silent){
      _soundpool.play(soundId);
    }
  }

  void start() {
    _play('start.mp3');
  }

  void clear() {
    _play('clean.mp3');
  }

  void fall() {
    _play('drop.mp3');
  }

  void rotate() {
    _play('rotate.mp3');
  }

  void move() {
    _play('move.mp3');
  }

  @override
  void dispose(){
    super.dispose();
    _soundpool.dispose();
  }
}
