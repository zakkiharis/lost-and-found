import 'package:flutter/material.dart';

class DetailTemuan extends StatelessWidget {
  // final Book book;
  // Detail(this.book);

  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: 5,
      backgroundColor: Color.fromRGBO(88, 246, 214, 100),
      title: Text('Detail Barang Temuan'),
      actions: <Widget>[
//        IconButton(
//          icon: Icon(Icons.search),
//          onPressed: () {},
//        )
      ],
    );

    ///detail of book image and it's pages
    final topLeft = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: 'Satu Kardus Buku',
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.green.shade600,
              child: Image(
                image: AssetImage('assets/buku.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        text(
          'Telp :085642317867',
          size: 12,
          padding: EdgeInsets.only(left: 15.0),
        ),
        text(
          'ID Line : paijo_uii',
          size: 12,
          padding: EdgeInsets.only(left: 15, top: 5.0),
        ),
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text('Buku satu kardus',
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          'Jenis : Buku',
          size: 12,
          padding: EdgeInsets.only(right: 8.0, top: 5.0),
        ),
        text(
          'Ditemukan oleh : Paijo',
          size: 12,
          padding: EdgeInsets.only(right: 8.0, top: 5.0),
        ),
        text(
          'Tempat: Kaliurang KM 14',
          size: 12,
          padding: EdgeInsets.only(right: 8.0, top: 5.0),
        ),
        text(
          'Waktu Tem. : 2020-01-16 ',
          size: 12,
          padding: EdgeInsets.only(right: 8.0, top: 5.0),
        ),
        SizedBox(height: 25.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.green.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () {},
            minWidth: 150.0,
            color: Color.fromRGBO(58, 40, 80, 100),
            child: text('Telphone', color: Colors.white, size: 13),
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

    ///scrolling text description
    final bottomContent = Container(
      height: MediaQuery.of(context).size.height - 285,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Deskripsi :",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              style: TextStyle(fontSize: 12, height: 1.5),
            ),
          ],
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

  ///create text widget
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
