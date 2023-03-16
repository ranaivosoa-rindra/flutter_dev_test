// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_test/functions/custom_dialog.dart';
import 'package:flutter_application_test/screens/search_screen.dart';
import 'package:flutter_application_test/service/api.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    final data = controller.albumList;
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          controller.getData();
        }
      },
    );

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Photos Album"),
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
                return Padding(
                  padding: EdgeInsets.all(18.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.network(data[index].url),
                    ),
                    title: Text(
                      data[index].title,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        customDialog(data[index]);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ),
                  ),
                );
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
