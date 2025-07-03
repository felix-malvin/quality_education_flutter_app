import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/lessons.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';

class EnrolledCourseCard extends StatelessWidget {
  final EnrolledCourse item;
  final int completed;
  final int total;
  final VoidCallback onReturn;

  const EnrolledCourseCard({
    super.key,
    required this.item,
    required this.completed,
    required this.total,
    required this.onReturn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [

    ],);
  }
}
