import 'package:lesson6todo/models/post_model.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
class PostRepository {
  final Dio _dio = Dio();
  PostRepository(){
    _dio.interceptors.add(TalkerDioLogger());
  }
  Future<List<PostModel>> getPosts() async{
    final Response response = await _dio.get('https://dummyjson.com/todos');
    var list = response.data['todos'] as List;
    List<PostModel> postList = [];
    list.forEach((element){
      postList.add(PostModel.fromJson(element));
    });
    return postList;
  }
  Future<PostModel> createPost(PostModel postModel)async{
    final Response response = await _dio.post('https://dummyjson.com/todos/add',
    data: postModel.toJson(),
    );
    return PostModel.fromJson(response.data);
  }
  Future<PostModel> getPostById(int id) async {
    final Response response = await _dio.get('https://dummyjson.com/todos/$id');
    return PostModel.fromJson(response.data);
  }
}