import 'package:flutter/material.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffefd9c7),
      height: 500.0,
      alignment: Alignment.center,
      child: Container(
        width: 500,
        height: 680,
        color: Colors.white,
        alignment: Alignment.center,
        child: Container(
            width: 360,
            height: 600,
            decoration: BoxDecoration(
                border: RDottedLineBorder.all(
                    width: 2,
                    color: Colors.red,
                    dottedLength: 15,
                    dottedSpace: 8
                )
            ),
            child: Stack(
              children: [
                Container(//大图
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 300),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page2/1.jpg'),
                      height: 230,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
                  child: Center(
                      child: Image(
                        image: AssetImage('assets/memory/page2/2.png'),
                        height: 150,
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 450, 210, 0),
                  child: Center(
                      child: Image(
                        image: AssetImage('assets/memory/page2/3.png'),
                        height: 30,
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 100, 50),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/memory/page2/4.png'),
                      width: 220,
                    )
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 560, 0, 0),
                  child: Center(
                    child: Text("第01页"),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}