import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/widget/navigation_widget.dart';

class BarangTemuan extends StatefulWidget {
  @override
  _BarangTemuanState createState() => _BarangTemuanState();
}

class _BarangTemuanState extends State<BarangTemuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 10),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Color.fromRGBO(88, 246, 214, 100),
          title: Center(child: Text('Barang Temuan')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            )
          ],
        ),
        body: listKehilangan(context),
        drawer: navigationDrawer(context));
  }
}

Widget listKehilangan(context) {
  return Column(
    children: <Widget>[
      Center(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        height: 40,
        width: MediaQuery.of(context).size.width - 25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cari barang temuan",
                ),
              ),
            ),
          ],
        ),
      )),
      Center(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height - 150,
          width: MediaQuery.of(context).size.width - 20,
          child: _ListTemuan(),
        ),
      ),
    ],
  );
}

class _ListTemuan extends StatefulWidget {
  @override
  _ListTemuanState createState() => _ListTemuanState();
}

class _ListTemuanState extends State<_ListTemuan> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.pushNamed(context, '/DetailTemuan');
            },
            child: ListTile(
              leading: Container(
                height: 100,
                width: 50,
                child: Image(
                  image: AssetImage('assets/buku.jpg'),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text.rich(TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Barang     : ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: 'Satu kardus buku',
                        style: TextStyle(fontSize: 14))
                  ])),
                  Text.rich(TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Jenis        : ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Buku', style: TextStyle(fontSize: 14))
                  ])),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Deskripsi :',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrs standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                              style: TextStyle(fontSize: 14)),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
