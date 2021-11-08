import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/routes.dart';

Widget navigationDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: Color.fromRGBO(88, 246, 214, 100)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, Home);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings_cell),
          title: Text('Barang temuan'),
          onTap: () {
            Navigator.pushNamed(context, TemuanBarang);
          },
        ),
        ListTile(
          leading: Icon(Icons.smartphone),
          title: Text('Barang Hilang'),
          onTap: () {
            Navigator.pushNamed(context, HilangBarang);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.sim_card),
          title: Text('Logout'),
          onTap: () {},
        ),
      ],
    ),
  );
}
