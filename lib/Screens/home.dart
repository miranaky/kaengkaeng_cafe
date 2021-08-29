import 'package:flutter/material.dart';
import 'package:kaengkaeng_cafe/Widgets/menuList.dart';
import 'package:kaengkaeng_cafe/Widgets/screentitle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(28, 28, 28, 10),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 130,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ScreenTitle(text: "Kaengkaeng Cafe"),
              ],
            ),
          ),
          Flexible(
            child: MenuList(),
          )
        ],
      ),
    ));
  }
}
