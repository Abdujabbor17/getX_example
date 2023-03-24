import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/model/post_model.dart';
import 'package:getx_example/view/home_page/widgets/post_item.dart';
import 'package:getx_example/view/splash/widgets/splash_item.dart';

import '../../controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Get.find<SplashController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: GetX(
          init: SplashController(),
        builder: (controller){
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount:  controller.posts.length,
                    itemBuilder: (ctx, index) {
                      //PostModel post = controller.posts[index];
                      return splashItem(context, controller.posts[index]);
                    },
                  ),
                ),
                controller.isLoading.value
                    ? const Center(
                  child: CircularProgressIndicator(),
                )
                    : const SizedBox.shrink(),
              ],
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
