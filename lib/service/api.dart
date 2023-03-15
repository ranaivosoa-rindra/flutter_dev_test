// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_application_test/model/data_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<DataModel>> getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    var response = await http.get(url);
    var body = response.body;
    var decoded = jsonDecode(body) as List<dynamic>;

    print("Response status : ${response.statusCode}");
    // print("Response datas : ${response.body}");
    print("body type: ${body.runtimeType}");
    print("decoded type: ${decoded.runtimeType}");

    if (response.statusCode == 200) {
      return decoded.map((e) => DataModel.fromJson(e)).toList();
    }
    return [];
  }
}
