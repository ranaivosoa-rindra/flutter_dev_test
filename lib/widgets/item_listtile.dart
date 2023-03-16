// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget itemListTile(String leadingLabel, Widget widget) => ListTile(
      leading: Text(
        leadingLabel,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: widget,
    );
