import 'package:dio/dio.dart';

import '../../model/post_model.dart';
import '../core/api/api.dart';
import '../core/api/dio_config.dart';
import 'log_service.dart';

class GetPostService {
  static final GetPostService _inheritance = GetPostService._init();

  static GetPostService get inheritance => _inheritance;

  GetPostService._init();

  static Future<List<PostModel>?> getPosts() async {
    try {
      Response res =
          await DioConfig.inheritance.createRequest().get(Urls.getPosts);
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200) {
        List<PostModel> postList = [];
        for (var e in (res.data as List)) {
          postList.add(PostModel.fromJson(e));
        }

        return postList;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
    }
    return null;
  }

  static Future<bool> createPost(PostModel newPost) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .post(Urls.addPost, data: {
        "userId": newPost.userId,
        "title": newPost.title,
        "body": newPost.body
      });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<bool> editPost(PostModel newPost) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .put(Urls.updatePost + newPost.id.toString(), data: {
        "userId": newPost.userId,
        "title": newPost.title,
        "body": newPost.body
      });
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<bool> deletePost(int id) async {
    try {
      Response res = await DioConfig.inheritance
          .createRequest()
          .delete(Urls.deletePost + id.toString());
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }
}
