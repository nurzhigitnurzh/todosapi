part of 'post_bloc.dart';
@immutable
sealed class PostState {}
final class PostInitial extends PostState{}
final class LoadingPostState extends PostState{}
final class ErrorPostState extends PostState{}
final class SuccessCreateState extends PostState{
  SuccessCreateState({required this.postModel});
  final PostModel postModel;
}
final class LoadedPostState extends PostState{
  LoadedPostState({required this.postlist});

  final List<PostModel> postlist;
}
final class LoadedPostDetailState extends PostState {
  LoadedPostDetailState({required this.postModel});
  final PostModel postModel;
}