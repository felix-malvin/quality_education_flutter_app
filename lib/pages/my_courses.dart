import 'package:flutter/material.dart';

class MyCoursePage extends StatelessWidget {
  const MyCoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My Course Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}