import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';

class DetailKehilangan extends StatelessWidget {
  final Kehilangan kehilangan;
  DetailKehilangan({this.kehilangan});

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: 5,
      backgroundColor: Color.fromRGBO(88, 246, 214, 100),
      title: Text('Detail Barang Hilang'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: 'detailpost.jenisBarang',
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.green.shade600,
              child: Image(
                image: AssetImage('assets/samsul9.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text('1 Buah', color: Colors.black, size: 12)
      ],
    );

    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(kehilangan.namaBarang,
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          'Ditemukan oleh : ' + kehilangan.nama,
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            text(
              'No.Telp : ' + kehilangan.nomorHp,
              isBold: true,
              padding: EdgeInsets.only(right: 8.0),
            ),
          ],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () {},
            minWidth: 160.0,
            color: Color.fromRGBO(58, 40, 80, 100),
            child: text('Hubungi', color: Colors.white, size: 13),
          ),
        )
      ],
    );

    final topContent = Container(
      color: Color.fromRGBO(88, 246, 214, 100),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    final bottomContent = Container(
      height: 325.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          kehilangan.detailInformasi,
          style: TextStyle(fontSize: 13.0, height: 1.5),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  text(String data,
          {Color color = Colors.black,
          num size = 14,
          EdgeInsetsGeometry padding = EdgeInsets.zero,
          bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(
          data,
          style: TextStyle(
              color: color,
              fontSize: size.toDouble(),
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      );
}
