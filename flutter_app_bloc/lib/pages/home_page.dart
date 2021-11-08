import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/widget/navigation_widget.dart';
import 'package:flutter_app_bloc/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(58, 40, 80, 100),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Color.fromRGBO(88, 246, 214, 100),
          title: Center(
              child: Text(
            'Home',
            key: Key('homeKey'),
          )),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: body(context),
        drawer: navigationDrawer(context),
      ),
    );
  }
}

Widget body(BuildContext context) {
  return Column(
    children: <Widget>[
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          width: MediaQuery.of(context).size.width - 50,
          height: 100.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(88, 246, 214, 100),
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Hello Zakki A Haris',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              Text(
                'Selamat Datang',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 20.0),
          width: MediaQuery.of(context).size.width - 90,
          height: 40.0,
          decoration: BoxDecoration(
              color: Color.fromRGBO(127, 115, 141, 100),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
          child: Center(
              child: Text(
            'Lost and Found',
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          )),
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  key: Key('tapKehilangan'),
                  onTap: () {
                    Navigator.pushNamed(context, HilangBarang);
                  },
                  child: Container(
                    width: 100,
                    height: 120,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Material(
                          elevation: 1.5,
                          color: Color.fromRGBO(255, 255, 255, 0),
                          child: Image(
                            image: AssetImage('assets/barang_hilang.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                        Container(
                          width: 100,
                          height: 20,
                          child: Center(
                            child: Text(
                              'Barang Hilang',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, TemuanBarang);
                  },
                  child: Container(
                    width: 100,
                    height: 120,
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Material(
                          elevation: 1.5,
                          color: Color.fromRGBO(255, 255, 255, 0),
                          child: Image(
                            image: AssetImage('assets/barang_temuan.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                        Container(
                          width: 100,
                          height: 20,
                          child: Center(
                            child: Text(
                              'Barang Temuan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Material(
                        elevation: 1.5,
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: Image(
                          image: AssetImage('assets/settings.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(
                          child: Text(
                            'Settings',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Material(
                        elevation: 1.5,
                        color: Color.fromRGBO(255, 255, 255, 0),
                        child: Image(
                          image: AssetImage('assets/profile.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                      Container(
                        width: 100,
                        height: 20,
                        child: Center(
                          child: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
