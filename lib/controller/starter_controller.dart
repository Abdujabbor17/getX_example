import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/post_model.dart';
import '../service/post_service.dart';
import '../service/utils_service.dart';


class StarterController extends GetxController {
  var isLoading = false;
  var posts = [];

  void apiPostList() async {
    isLoading = true;
    update();
    var res =  await GetPostService.getPosts();
    if(res != null){
      posts = res;
    }
    isLoading = false;
    update();
  }


  void deletePost(BuildContext context,PostModel post) async{
    isLoading = true;
    update();
    bool result = await GetPostService.deletePost(post.id);
    if (result) {
      Utils.snackBarSuccess('deleted successfully', context);
    } else {
      Utils.snackBarError('Someting is wrong', context);
    }
    isLoading = false;
    update();
  }

}