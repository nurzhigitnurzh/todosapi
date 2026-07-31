part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
final class GetPostEvent extends PostEvent{}
final class CreatePostEvent extends PostEvent{
  CreatePostEvent({required this.postModel});
  final PostModel postModel;
}
final class GetPostByIdEvent extends PostEvent {
  GetPostByIdEvent({required this.id});
  final int id;
}