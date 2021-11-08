import 'package:flutter_app_bloc/data/model/model_kehilangan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class KehilanganRequestFailure implements Exception {}

class KehilanganRepository {
  var url = Uri.parse("http://192.168.43.245:8080/rest-server/api/kehilangan");

  Future<List<Kehilangan>> getKehilangan() async {
    final response = await http.get(
      url,
      headers: {
        "HttpHeaders.contentTypeHeader": "application/json",
        "X-API-KEY": "pass"
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return List<Kehilangan>.from(
          data.map((item) => Kehilangan.fromJson(item)));
    } else {
      throw KehilanganRequestFailure();
    }
  }
}
