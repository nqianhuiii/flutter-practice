import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnit_app/home.dart';
import 'package:learnit_app/pages/detailed_posting.dart';
import 'package:learnit_app/pages/post_question.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/post_question': (context) => const PostQuestion(),
      '/detailed_post': (context) => const DetailedPost(),
    },
  ));
}

