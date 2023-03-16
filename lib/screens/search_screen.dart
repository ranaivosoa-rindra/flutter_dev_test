// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_test/model/album_photo_model.dart';
import 'package:flutter_application_test/widgets/search_bar.dart';
import 'package:get/get.dart';
import '../service/api.dart';
import '../widgets/photo_card.dart';

class SearchScreen extends StatefulWidget {
  final List<AlbumPhotoModel> model;
  const SearchScreen({super.key, required this.model});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool showSearchBar = false;
  final TextEditingController textController = TextEditingController();
  final controller = Get.find<Controller>();

  // Variables for searching text
  String query = "";
  List<AlbumPhotoModel> albumPhotos = [];
  List<AlbumPhotoModel> albumDisplay = [];

  // we use this variable to hide the "no image found" when 1st time openning the search screen
  bool isFirstTime = true;

  void searchPhoto(String searchedText) {
    query = searchedText.toLowerCase();

    setState(() {
      albumDisplay = albumPhotos.where((element) {
        var seachTitle = element.title.toLowerCase();

        return seachTitle.contains(query);
      }).toList();
      isFirstTime = false;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      albumPhotos = widget.model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Search for a specific photo",
            style: TextStyle(fontSize: 19),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: searchBar(textController, searchPhoto),
              ),
              (isFirstTime)
                  ? SizedBox()
                  : (albumDisplay.isNotEmpty)
                      ? Expanded(
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: albumDisplay.length,
                            itemBuilder: (context, index) {
                              return photoCard(albumDisplay[index]);
                            },
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 90,
                                  width: 90,
                                  child: Image.asset(
                                      "assets/images/no-pictures.png")),
                              Text("Sorry, no photo found ..."),
                            ],
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
