import 'package:flutter/material.dart';

Widget searchBar(TextEditingController textController,
        void Function(String) searchPhoto) =>
    TextField(
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Icon(
            Icons.search,
            size: 19,
          ),
        ),
        hintText: "Search the title of a photo...",
        hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(width: 1),
        ),
      ),
      style: const TextStyle(fontSize: 16),
      onChanged: searchPhoto,
    );
