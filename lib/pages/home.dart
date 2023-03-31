import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
             GoRouter.of(context).go('/post_resources');
            },
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              margin: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  "Notes",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go('/forum');
            },
            child: Container(
              height: 150,
              width: double.infinity,
              color: Colors.green,
              margin: const EdgeInsets.all(10),
              child: const Center(
                child: Text(
                  "Question Exchange",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
