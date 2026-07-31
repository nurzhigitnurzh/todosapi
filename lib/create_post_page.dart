import 'package:flutter/material.dart';
import 'package:lesson6todo/models/post_model.dart';
import 'package:lesson6todo/post/bloc/post_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  bool completed = false;
  final TextEditingController _title = TextEditingController();
  final TextEditingController _userId = TextEditingController();
  final PostBloc _postBloc = PostBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextField(controller: _title, decoration: InputDecoration(hintText: 'TITLE'),),
          TextField(controller: _userId, decoration: InputDecoration(hintText: 'user id'),),
          Checkbox.adaptive(value: completed, onChanged: (value) {
            setState(() {
              completed = value ?? false;
              setState(() {
                
              });
            });
          },
          ),
          BlocConsumer<PostBloc, PostState>(
            bloc: _postBloc,
            listener: (context, state) {
              if(state is SuccessCreateState){
                toastification.show(
                  context:context, 
                  title: Text('Success you created post'), 
                  autoCloseDuration: const Duration(seconds: 5),
                  );
              }
              if(state is ErrorPostState){
                toastification.show(
                  context:context, 
                  title: Text('Error post'),
                  backgroundColor: Colors.red, 
                  icon: Icon(Icons.close),
                  autoCloseDuration: const Duration(seconds: 5),
                  );
              }
            },  
              
            builder: (context, state) {
              final bool isLoading = state is LoadingPostState;
              return MaterialButton(
              onPressed: isLoading ? null : () {
                _postBloc.add(CreatePostEvent(postModel:PostModel(
                todo: _title.text, 
                completed: completed, 
                userId: int.parse(_userId.text))));
              },
              child: isLoading 
              ? CircularProgressIndicator.adaptive() 
              :Text('Create Post'.toUpperCase()),
              );
            },
          )
        ],)
    ),
    );
  }
}