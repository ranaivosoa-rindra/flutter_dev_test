import 'package:flutter/material.dart';
import 'package:flutter_application_test/model/album_photo_model.dart';
import '../functions/custom_dialog.dart';

Widget photoCard(AlbumPhotoModel data) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(data.url),
        ),
        title: Text(
          data.title,
          style: const TextStyle(fontSize: 13),
        ),
        trailing: IconButton(
          onPressed: () {
            customDialog(data);
          },
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
        ),
      ),
    );
