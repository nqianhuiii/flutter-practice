import 'package:flutter/material.dart';

class DetailedPost extends StatefulWidget {
  const DetailedPost({super.key});

  @override
  State<DetailedPost> createState() => _DetailedPostState();
}

class _DetailedPostState extends State<DetailedPost> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hi'),
        )),
    );
  }
}