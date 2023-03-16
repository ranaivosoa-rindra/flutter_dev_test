import 'package:flutter/material.dart';

Widget itemListTile(String leadingLabel, Widget widget) => ListTile(
      leading: Text(
        leadingLabel,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      title: widget,
    );
