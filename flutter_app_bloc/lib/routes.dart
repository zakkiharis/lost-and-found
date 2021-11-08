import 'package:flutter/material.dart';
import 'package:flutter_app_bloc/pages/kehilangan/detail_kehilangan.dart';
import 'package:flutter_app_bloc/pages/kehilangan/list_barang_hilang.dart';
import 'package:flutter_app_bloc/pages/home_page.dart';
import 'package:flutter_app_bloc/pages/temuan/list_barang_temuan.dart';

import 'main.dart';

const String Home = "/";
const String HilangBarang = "/barangHilang";
const String TemuanBarang = "/temuanHilang";
const String TemuanDetail = "/detailTemuan";
const String KehilanganDetail = "/kehilanganDetail";

class Routers {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case HilangBarang:
        return MaterialPageRoute(builder: (_) => BarangHilang());
      case TemuanBarang:
        return MaterialPageRoute(builder: (_) => BarangTemuan());
      case KehilanganDetail:
        var data = routeSettings.arguments;
        print(data);
        return MaterialPageRoute(
            builder: (_) => DetailKehilangan(
                  kehilangan: data,
                ));
      default:
        return MaterialPageRoute(builder: (_) => MyApp());
    }
  }
}
