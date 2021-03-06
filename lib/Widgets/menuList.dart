import 'package:flutter/material.dart';
import 'package:kaengkaeng_cafe/Screens/details.dart';
import 'package:kaengkaeng_cafe/models/Cafe.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Widget> _menuTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _addMenus();
    });
  }

  void _addMenus() {
    List<Cafe> _menus = [
      Cafe(name: "Americano", price: "3.0", img: "americano.jpg"),
      Cafe(name: "Iced Americano", price: "3.0", img: "iced_americano.jpg"),
      Cafe(name: "Latte", price: "4.0", img: "latte.jpg"),
      Cafe(name: "Vanilla Latte", price: "4.0", img: "vanillalatte.jpg"),
      Cafe(name: "Brewed Coffee", price: "2.5", img: "brewedcoffee.jpg"),
      Cafe(name: "Drip Coffee", price: "5.0", img: "dripcoffee.jpg"),
      Cafe(name: "Frappuccino", price: "5.0", img: "frappuccino.jpg"),
      Cafe(name: "Frappe", price: "4.0", img: "frappe.jpg"),
    ];

    Future ft = Future(() {});
    _menus.forEach((Cafe cafe) {
      ft = ft.then((_) {
        return Future.delayed(const Duration(milliseconds: 150), () {
          _menuTiles.add(_buildMenu(cafe));
          _listKey.currentState?.insertItem(_menuTiles.length - 1);
        });
      });
    });
  }

  Widget _buildMenu(Cafe menu) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(menu: menu)));
      },
      contentPadding: EdgeInsets.all(17),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(menu.name,
              style: TextStyle(fontSize: 22, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${menu.img}',
          child: Image.asset(
            'images/${menu.img}',
            height: 50,
          ),
        ),
      ),
      trailing: Text("\$${menu.price}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Tween<Offset> _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _menuTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: _menuTiles[index],
        );
      },
    );
  }
}
