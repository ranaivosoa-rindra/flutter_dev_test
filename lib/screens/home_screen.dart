// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_test/service/api.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    final data = controller.albumList;
    final ScrollController scrollController = ScrollController();

    // if (controller.isFirstLoading.value) {
    //   controller.firstLoad();
    // }

    scrollController.addListener(
      () {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          controller.getData();
        }
      },
    );

    return Scaffold(
      body: Obx(() {
        return Column(children: [
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ListTile(
                    title: Text(data[index].id.toString()),
                    subtitle: Text(data[index].title),
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
        // if (controller.isLoading.value) {
        //   return Center(
        //     child: CircularProgressIndicator(
        //       color: Colors.red,
        //     ),
        //   );
        // } else {
        //   return Column(children: [
        //     Expanded(
        //       child: ListView.builder(
        //         controller: scrollController,
        //         shrinkWrap: true,
        //         itemCount: data.length,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(18.0),
        //             child: ListTile(
        //               title: Text(data[index].id.toString()),
        //               subtitle: Text(data[index].title),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     if (controller.isLoading.value == true)
        //       const Padding(
        //         padding: EdgeInsets.only(top: 10, bottom: 40),
        //         child: Center(
        //           child: CircularProgressIndicator(color: Colors.blue),
        //         ),
        //       ),
        //   ]);
        // }
      }),
    );
  }
}
