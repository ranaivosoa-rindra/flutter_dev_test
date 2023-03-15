// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    var response = await http.get(url);
    var body = response.body;
    var decoded = jsonDecode(body);

    print("Response status : ${response.statusCode}");
    // print("Response datas : ${response.body}");
    print("body type: ${body.runtimeType}");
    print("decoded : ${decoded.length}");
  }
}
