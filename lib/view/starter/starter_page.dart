import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/view/starter/widgets/starter_item.dart';

import '../../controller/starter_controller.dart';
import '../../model/post_model.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({Key? key}) : super(key: key);

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {

  @override
  void initState() {
    super.initState();
    Get.find<StarterController>().apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX"),
      ),
      body: GetBuilder(
          init: StarterController(),
        builder: (controller){
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: controller.posts.length,
                    itemBuilder: (ctx, index) {
                      PostModel post = controller.posts[index];
                      return starterItem(context, post);
                    },
                  ),
                ),
                controller.isLoading
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
