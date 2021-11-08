import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_state.dart';
import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
import 'package:flutter_app_bloc/data/repository/kehilangan_repository.dart';
import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_bloc.dart';
import 'package:flutter_app_bloc/data/domain/kehilangan_domain.dart';
import 'package:flutter_app_bloc/widget/navigation_widget.dart';
import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_event.dart';
import 'package:flutter_app_bloc/routes.dart';

class BarangHilang extends StatefulWidget {
  @override
  _BarangHilangState createState() => _BarangHilangState();
}

class _BarangHilangState extends State<BarangHilang> {
  KehilanganBloc _kehilanganBloc;
  KehilanganDomain _kehilanganDomain;

  @override
  void initState() {
    super.initState();
    _kehilanganDomain = new KehilanganDomain(KehilanganRepository());
    _kehilanganBloc = new KehilanganBloc(kehilanganDomain: _kehilanganDomain);
  }

  @override
  void dispose() {
    _kehilanganBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _kehilanganBloc.add(KehilanganFetching());
    return BlocProvider(
      create: (BuildContext context) {
        return _kehilanganBloc;
      },
      child: Scaffold(
          backgroundColor: Color.fromRGBO(241, 241, 241, 10),
          appBar: AppBar(
            key: const Key("keyAppbar"),
            elevation: 5,
            backgroundColor: Color.fromRGBO(88, 246, 214, 100),
            title: Center(child: Text('Barang Hilang')),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushNamed(context, Home);
                },
              ),
            ],
          ),
          // body: listKehilangan(context),
          body: BlocListener<KehilanganBloc, KehilanganState>(
            bloc: _kehilanganBloc,
            listener: (context, state) {
              if (state is KehilanganFetchError) {
                print(state.error.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${state.error}'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: new BlocBuilder<KehilanganBloc, KehilanganState>(
              bloc: _kehilanganBloc,
              builder: (BuildContext context, KehilanganState state) {
                if (state is KehilanganFetchSuccess) {
                  return Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: _ListKehilangan(
                            kehilangan: state.kehilangan,
                          )));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          floatingActionButton: BlocBuilder<KehilanganBloc, KehilanganState>(
              bloc: _kehilanganBloc,
              builder: (BuildContext context, KehilanganState state) {
                if (state is KehilanganFetchSuccess) {
                  return FloatingActionButton(
                    backgroundColor: Color.fromRGBO(88, 246, 214, 100),
                    onPressed: () async {
                      final Kehilangan result = await showSearch(
                        context: context,
                        delegate: KehilanganSearch(state.kehilangan),
                      );
                      if (result != null) {
                        Navigator.pushNamed(context, KehilanganDetail,
                            arguments: result);
                      }
                    },
                    tooltip: 'Search',
                    child: Icon(Icons.search),
                  );
                } else {
                  return Center(
                    child: Text(''),
                  );
                }
              }),
          drawer: navigationDrawer(context)),
    );
  }
}

class _ListKehilangan extends StatelessWidget {
  final List<Kehilangan> kehilangan;
  _ListKehilangan({this.kehilangan});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: kehilangan.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () {
              Navigator.pushNamed(context, KehilanganDetail,
                  arguments: kehilangan[index]);
              // print(apiservice.idKehilangan);
            },
            child: ListTile(
              leading: Container(
                height: 100,
                width: 50,
                child: Image(
                  image: AssetImage('assets/samsul9.jpeg'),
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
                        text: kehilangan[index].namaBarang,
                        style: TextStyle(fontSize: 14))
                  ])),
                  Text.rich(TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Jenis        : ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: kehilangan[index].jenisBarang,
                        style: TextStyle(fontSize: 14))
                  ])),
                  RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Deskripsi : ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: kehilangan[index].detailInformasi,
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

class KehilanganSearch extends SearchDelegate<Kehilangan> {
  final List<Kehilangan> kehilangan;

  KehilanganSearch(this.kehilangan);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    final result =
        kehilangan.where((a) => a.namaBarang.toLowerCase().contains(query));

    return ListView(
      children: result
          .map<Card>((e) => Card(
                color: Color.fromRGBO(1, 1, 1, 0),
                child: ListTile(
                  leading: Container(
                    height: 100,
                    width: 50,
                    child: Image(
                      image: AssetImage('assets/samsul9.jpeg'),
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
                            text: e.namaBarang, style: TextStyle(fontSize: 14))
                      ])),
                      Text.rich(TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: 'Jenis        : ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: e.jenisBarang, style: TextStyle(fontSize: 14))
                      ])),
                    ],
                  ),
                  onTap: () {
                    close(context, e);
                  },
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result =
        kehilangan.where((a) => a.namaBarang.toLowerCase().contains(query));

    return ListView(
      children: result
          .map<ListTile>((e) => ListTile(
                title: Text(e.namaBarang,
                    style: TextStyle(fontSize: 16.0, color: Colors.blue)),
                onTap: () {
                  query = e.namaBarang.toLowerCase();
                },
              ))
          .toList(),
    );
  }
}
