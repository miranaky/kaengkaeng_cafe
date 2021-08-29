import 'package:flutter/material.dart';

class FavList extends StatelessWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 2500),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.list,
          size: 40,
          color: Colors.white,
        ),
        padding: EdgeInsets.only(top: 28),
      ),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double _val, child) {
        return Opacity(
          opacity: _val,
          child: child,
        );
      },
    );
  }
}
