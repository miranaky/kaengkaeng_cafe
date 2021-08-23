import 'package:flutter/material.dart';
import 'package:kaengkaeng_cafe/Screens/details.dart';
import 'package:kaengkaeng_cafe/models/Cafe.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<Widget> _menuTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addMenus();
  }

  void _addMenus() {
    List<Cafe> _menus = [
      Cafe(name: "Americano", price: "3.0", img: "americano.jpg"),
      Cafe(name: "Latte", price: "3.0", img: "latte.jpg"),
      Cafe(name: "Brewed Coffee", price: "3.0", img: "brewedcoffee.jpg"),
      Cafe(name: "Drip Coffee", price: "3.0", img: "dripcoffee.jpg"),
      Cafe(name: "Frappuccino", price: "3.0", img: "frappuccino.jpg"),
    ];
    _menus.forEach((Cafe cafe) {
      _menuTiles.add(_buildMenu(cafe));
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
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${menu.img}',
          height: 50,
        ),
      ),
      trailing: Text("\$${menu.price}",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _menuTiles.length,
      itemBuilder: (context, index) {
        return _menuTiles[index];
      },
    );
  }
}
