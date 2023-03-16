// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showSearchBar = false;
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: (!showSearchBar)
            ? Text("Search for a specific photo")
            : TextField(
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Filter the title of an album",
                ),
              ),
        actions: [
          (!showSearchBar)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showSearchBar = true;
                    });
                  },
                  child: Icon(Icons.search),
                )
              : InkWell(
                  onTap: () {
                    setState(() {
                      showSearchBar = false;
                    });
                  },
                  child: Icon(Icons.close),
                )
        ],
      ),
    );
  }
}
