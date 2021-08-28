import 'package:flutter/material.dart';
import 'package:kaengkaeng_cafe/Widgets/heart.dart';
import 'package:kaengkaeng_cafe/models/Cafe.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Details extends StatelessWidget {
  final Cafe menu;
  Details({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Hero(
                tag: 'location-img-${menu.img}',
                child: Image.asset(
                  "images/${menu.img}",
                  height: 420,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text(
                menu.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.grey[800]),
              ),
              subtitle: Text("\$${menu.price}",
                  style: TextStyle(fontSize: 17, letterSpacing: 1)),
              trailing: Heart(),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                lorem(paragraphs: 1, words: 60),
                style: TextStyle(color: Colors.grey[600], height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
