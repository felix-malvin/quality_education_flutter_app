import 'package:flutter/material.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';

class LessonDetailPage extends StatefulWidget {
  const LessonDetailPage({super.key});

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Lesson'),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Text('Lesson Detail Page'),
      ),
    );
  }
}
