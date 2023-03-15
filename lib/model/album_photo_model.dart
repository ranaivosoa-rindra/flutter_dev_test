// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part "album_photo_model.g.dart";

@JsonSerializable()
class AlbumPhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;
  AlbumPhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory AlbumPhotoModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumPhotoModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumPhotoModelToJson(this);
}
