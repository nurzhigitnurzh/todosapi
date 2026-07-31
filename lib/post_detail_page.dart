import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson6todo/post/bloc/post_bloc.dart';

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.id});
  final int id;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  final PostBloc _postBloc = PostBloc();

  @override
  void initState() {
    _postBloc.add(GetPostByIdEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Detail')),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          bloc: _postBloc,
          builder: (context, state) {
            if (state is LoadedPostDetailState) {
              final post = state.postModel;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${post.id}', style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text('Todo: ${post.todo}', style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text('Completed: ${post.completed}', style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text('User ID: ${post.userId}', style: const TextStyle(fontSize: 20)),
                  ],
                ),
              );
            }
            if (state is ErrorPostState) {
              return const Text('Error', style: TextStyle(fontSize: 40, color: Colors.red));
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}