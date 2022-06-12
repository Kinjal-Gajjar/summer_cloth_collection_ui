import 'package:flutter/material.dart';
import 'package:summer_cloth_collection_ui/homepage.dart';

void main(){
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Collection app UI',
      home: HomePage(),
    );
  }
}