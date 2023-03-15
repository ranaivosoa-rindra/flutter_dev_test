// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_application_test/model/album_photo_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var albumList = <AlbumPhotoModel>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    var response = await http.get(url);
    var body = response.body;
    var decoded = jsonDecode(body) as List<dynamic>;

    print("Response status : ${response.statusCode}");
    // print("Response datas : ${response.body}");
    print("body type: ${body.runtimeType}");
    print("decoded type: ${decoded.runtimeType}");

    if (response.statusCode == 200) {
      albumList
          .addAll(decoded.map((e) => AlbumPhotoModel.fromJson(e)).toList());
    } else {
      Get.snackbar(
          "Fetching data error", "Error code : ${response.statusCode}");
    }
    // albumList.addAll(decoded.map((e) => AlbumPhotoModel.fromJson(e)).toList());

    // if (response.statusCode == 200) {
    //   return albumList;
    // } else {
    //   Get.snackbar(
    //       "Fetching data error", "Error code : ${response.statusCode}");
    //   return [];
    // }
  }
}
