// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_test/screens/search_screen.dart';
import 'package:flutter_application_test/service/api.dart';
import 'package:flutter_application_test/widgets/photo_card.dart';
import 'package:get/get.dart';

import '../model/album_photo_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<Controller>();
  final newController = Get.find<Controller>();
  List<AlbumPhotoModel> data = [];
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    data = controller.albumList;
    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          controller.getData();
        }
      },
    );
    newController.getFullAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/drawer_header_image.png"),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Main list"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search for specific item"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      model: newController.newAlbumList,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Photos Album",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: Obx(() {
        return Column(children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: scrollController,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return photoCard(data[index]);
              },
            ),
          ),
          if (controller.isLoading.value == true)
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 40),
              child: Center(
                child: CircularProgressIndicator(color: Colors.blue),
              ),
            ),
        ]);
      }),
    );
  }
}
