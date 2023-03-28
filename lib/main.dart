import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:learnit_app/home.dart';
import 'package:learnit_app/pages/detailed_posting.dart';
import 'package:learnit_app/pages/post_question.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp.router(
    routerConfig: _router,
  ));
}

final GoRouter _router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const Home(),
  ),
  GoRoute(
    path: "/post_question",
    builder: (context, state) => const PostQuestion(),
  ),
  GoRoute(
    path: "/detailed_post/:title/:description",
    builder: (context, state) => DetailedPost(
      questionTitle: state.params['title']!,
      questionDescription: state.params['description']!,
      ),
    ),
]
);
