// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'dart:convert';
import 'package:flutter_application_test/model/album_photo_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  var albumList = <AlbumPhotoModel>[].obs;
  var newAlbumList = <AlbumPhotoModel>[].obs;
  var isLoading = false.obs;
  RxInt currentPage = 0.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future getData() async {
    isLoading(true);
    currentPage.value++;
    var url = Uri.parse(
        "https://jsonplaceholder.typicode.com/photos?_start=${(currentPage.value - 1) * 30}&_limit=30");
    // 1st time: page 0 - 30
    // 2nd time: page 30 - 60
    // 3rd time: page 60 - 90
    // ...

    var response = await http.get(url);
    var body = response.body;
    var decoded = jsonDecode(body) as List<dynamic>;

    if (response.statusCode == 200) {
      albumList
          .addAll(decoded.map((e) => AlbumPhotoModel.fromJson(e)).toList());
      isLoading(false);
    } else {
      isLoading(false);
      Get.snackbar(
          "Fetching data error", "Error code : ${response.statusCode}");
    }
  }

  Future getFullAlbum() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");

    var response = await http.get(url);
    var body = response.body;
    var decoded = jsonDecode(body) as List<dynamic>;

    if (response.statusCode == 200) {
      newAlbumList
          .addAll(decoded.map((e) => AlbumPhotoModel.fromJson(e)).toList());
      isLoading(false);
    } else {
      isLoading(false);
      Get.snackbar(
          "Fetching data error", "Error code : ${response.statusCode}");
    }
  }
}
