import 'package:lesson6todo/models/post_model.dart';
import 'package:dio/dio.dart';
class PostRepository {
  final Dio _dio = Dio();
  Future<List<PostModel>> getPosts() async{
    final Response response = await _dio.get('https://dummyjson.com/todos');
    var list = response.data['todos'] as List;
    List<PostModel> postList = [];
    list.forEach((element){
      postList.add(PostModel.fromJson(element));
    });
    return postList;
  }
}