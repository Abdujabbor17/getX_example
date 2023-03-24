

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/model/post_model.dart';

import '../service/post_service.dart';
import '../service/utils_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var posts = [].obs;

   // final userIdCtr = TextEditingController().obs;
   // final titleCtr = TextEditingController().obs;
   // final bodyCtr = TextEditingController().obs;


  void apiPostList() async {
    isLoading.value = true;
    var res =  await GetPostService.getPosts();
    if(res != null){
      posts.value = res;
    }
    isLoading.value = false;
  }


  void deletePost(BuildContext context,PostModel post) async{
    isLoading.value = true;
    bool result = await GetPostService.deletePost(post.id);
    if (result) {
      Utils.snackBarSuccess('deleted successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
    isLoading.value = false;
  }


}