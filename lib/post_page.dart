import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson6todo/create_post_page.dart';
import 'package:lesson6todo/post/bloc/post_bloc.dart';
import 'package:lesson6todo/post_detail_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc _postBloc = PostBloc();


  @override
  void initState() {
    _postBloc.add(GetPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostPage()));
        },
      ),
      body: Center(
        child: BlocBuilder<PostBloc, PostState>(
          bloc: _postBloc,
          builder: (context, state) {
            if (state is LoadedPostState) {
              state.postlist;
              return ListView.builder(
                itemCount: state.postlist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostDetailPage(id: state.postlist[index].id),
                        ),
                      );
                    },
                    title: Text('${state.postlist[index].todo}'));
                },
              );
            }
            if (state is ErrorPostState) {
              return Text( 'Flutter 06', style: TextStyle(fontSize: 100, color: Colors.red)
              );
            }
            return Text('Post Page');
          },
        ), 
      ),
    );
    
  }
  }