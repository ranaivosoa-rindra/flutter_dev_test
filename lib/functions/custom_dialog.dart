import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/album_photo_model.dart';
import '../widgets/custom_divider.dart';
import '../widgets/item_listtile.dart';

void customDialog(AlbumPhotoModel data) {
  Get.dialog(AlertDialog(
    scrollable: true,
    title: const Text("Photo detail"),
    content: Column(
      children: [
        itemListTile(
            "id : ",
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(data.id.toString()),
            )),
        customDivider(),
        itemListTile(
          "title : ",
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              data.title,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        customDivider(),
        itemListTile(
            "Image url : ",
            CircleAvatar(
              child: Image.network(data.url),
            )),
        customDivider(),
        itemListTile(
          "ThumbnaiUrl : ",
          CircleAvatar(
            child: Image.network(data.thumbnailUrl),
          ),
        )
      ],
    ),
    actions: [
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Ok'),
      ),
      TextButton(
        onPressed: () {
          Get.back();
        },
        child: const Text('Back'),
      ),
    ],
  ));
}
