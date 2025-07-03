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
      Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFE6E6E6), width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: Center(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item.enrolledCourse.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: category_container_color,
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Text(
                                          item.enrolledCourse.category,
                                          style: AppWidget.Badge(
                                            category_color,
                                          ),
                                        ),
                                      ),
                                    ),
    ],);
  }
}
