import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:example_rest_full_api_1/model/list.dart' as listRestful;

class Connection {
  static Connection connection;

  static String url = "https://www.swapi.tech/api/";

  static getInstance() {
    if (connection == null) {
      connection = Connection();
    }

    return connection;
  }

  Future<List<listRestful.List>> getListMenu() async {
    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> bodyJson = convert.jsonDecode(response.body);

      List<listRestful.List> lists = [];

      bodyJson.forEach((key, value) {
        lists.add(listRestful.List(name: key, url: value));
      });

      return lists;
    } else {
      print("Permasalah terjadi pada koneksi ke dalam server SWAPI");
    }
  }
}
