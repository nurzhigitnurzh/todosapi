import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson6todo/models/post_model.dart';
import 'package:lesson6todo/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      try {
        emit(LoadingPostState());
        final getPosts = await repository.getPosts();
        emit(LoadedPostState(postlist: getPosts));
      } catch (e) {
        emit(ErrorPostState());
      }
    });
  }
}