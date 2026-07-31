import 'package:flutter/material.dart';
import 'package:lesson6todo/post_page.dart';
import 'package:toastification/toastification.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(child:MaterialApp(home: PostPage()) );
  }
}