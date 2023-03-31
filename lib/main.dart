import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:learnit_app/pages/forum.dart';
import 'package:learnit_app/pages/detailed_posting.dart';
import 'package:learnit_app/pages/home.dart';
import 'package:learnit_app/pages/post_question.dart';
import 'package:learnit_app/pages/post_resources.dart';

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
    path: "/forum",
    builder: (context, state) => const Forum(),
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
    GoRoute(
    path: "/post_resources",
    builder: (context, state) => const PostResources(),
  ),
]
);
