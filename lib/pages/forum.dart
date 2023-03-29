import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learnit_app/models/question_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learnit_app/pages/question_posting.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _HomeState();
}

class _HomeState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forum',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
          ),
          onPressed: (() {
            GoRouter.of(context).go('/');
          }),
        ),
      ),
      body: const QuestionPosting(),
    ));
  }

  Widget buildQuestionCard(Question question) => Card(
        child: ListTile(
          title: Text(question.title),
          subtitle: Text(question.description),
        ),
      );

  Stream<List<Question>> readQuestions() => FirebaseFirestore.instance
      .collection('questions')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Question.fromJson(doc.data())).toList());
}
