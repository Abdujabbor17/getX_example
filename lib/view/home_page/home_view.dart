
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_example/view/home_page/widgets/post_item.dart';
import '../../controller/home_controller.dart';
import '../../model/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   final _controller = Get.put(HomeController());


  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().apiPostList();
    //_controller.apiPostList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Posts",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
            // _controller.addPost(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Obx(
            () => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: Get.find<HomeController>().posts.length,
                itemBuilder: (ctx, index) {
                  PostModel post = Get.find<HomeController>().posts[index];
                  return postItem(context,_controller, post,(){});
                },
              ),
            ),
            _controller.isLoading.value
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : const SizedBox.shrink(),
          ],
        ),
      )
    );
  }


}
