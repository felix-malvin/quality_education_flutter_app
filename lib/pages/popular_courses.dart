import 'package:flutter/material.dart';

class PopularCoursesPage extends StatelessWidget {
  const PopularCoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Popular Courses Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}