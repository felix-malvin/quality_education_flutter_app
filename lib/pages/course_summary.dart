import 'package:flutter/material.dart';

class CourseSummaryPage extends StatelessWidget {
  const CourseSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Course Summary Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}