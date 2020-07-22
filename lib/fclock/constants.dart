import 'package:flutter/material.dart';

const int purple = 0xff3c1361;
const int red = 0xffff2525;
const int brightYellow = 0xffffe03d;
const int midYellow = 0xffffd03d;
const int yellow = 0xffffc03d;
const int silver = 0xfff2f5fc;
const int darkSilver = 0xffe7eefb;

const kTopRowTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Color(purple),
);

const kSelectedTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Color(midYellow),
);

const kTimeTextStyle = TextStyle(
  fontSize: 56.0,
  fontWeight: FontWeight.bold,
  fontFamily: 'Varela',
  color: Colors.green,
);

const kActiveButtonGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: <Color>[
    Color(0xffffc03d),
    Color(0xffffd03d),
    Color(0xffffe03d),
  ],
);

const kInActiveButtonGradient = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: <Color>[
    Color(0xffe7eefb),
    Color(0xfff2f5fc),
  ],
);