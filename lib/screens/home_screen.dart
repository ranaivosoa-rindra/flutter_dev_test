// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_test/screens/search_screen.dart';
import 'package:flutter_application_test/service/api.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

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
                        Get.dialog(AlertDialog(
                          scrollable: true,
                          title: Text("Photo detail"),
                          content: Column(
                            children: [
                              ListTile(
                                leading: Text(
                                  "id : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(data[index].id.toString()),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                margin: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              ListTile(
                                leading: Text(
                                  "title : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    data[index].title,
                                    style: TextStyle(
                                      color: Colors.grey[800],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                margin: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              ListTile(
                                leading: Text(
                                  "Image url : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: CircleAvatar(
                                  child: Image.network(data[index].url),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 0.5,
                                margin: EdgeInsets.symmetric(vertical: 18),
                                decoration: BoxDecoration(color: Colors.grey),
                              ),
                              ListTile(
                                leading: Text(
                                  "ThumbnaiUrl : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                title: CircleAvatar(
                                  child:
                                      Image.network(data[index].thumbnailUrl),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Ok'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('Back'),
                            ),
                          ],
                        ));
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
