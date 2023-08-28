import 'package:api_call/data/respository/api/dio.dart';
import 'package:api_call/models/Api_posts_Model.dart';
import 'package:dio/dio.dart';

class PostReposetry {
  Api_Dio api = Api_Dio();
  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get('/posts');
      List<dynamic> PostMaps = response.data;
      return PostMaps.map((Postmap) => PostModel.fromJson(Postmap)).toList();
    } catch (err) {
      throw (err);
    }
  }
}
