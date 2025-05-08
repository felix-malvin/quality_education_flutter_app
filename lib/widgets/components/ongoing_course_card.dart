import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/lessons.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/models/course_model.dart';

class OngoingCourseCard extends StatefulWidget {
  final String image;
  final String courseName;
  final String courseTutor;
  final String courseCategory;
  final int courseLessons;
  final String baseColor;
  final int progress;
  final Course course;

  const OngoingCourseCard({
    super.key,
    required this.image,
    required this.courseName,
    required this.courseTutor,
    required this.courseCategory,
    required this.courseLessons,
    required this.baseColor,
    required this.progress,
    required this.course,
  });

  @override
  State<OngoingCourseCard> createState() => _OngoingCourseCardState();
}

class _OngoingCourseCardState extends State<OngoingCourseCard> {
  @override
  Widget build(BuildContext context) {
    Color category_color = Color(int.parse('0xFF' + widget.baseColor));
    Color category_container_color = Color(
      int.parse('0x17' + widget.baseColor),
    );
    double completed_lessons_percentage =
        widget.progress / widget.courseLessons;

    return Column(
      children: [
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
                        widget.image,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 22,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: category_container_color,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.courseCategory,
                                        style: AppWidget.Badge(category_color),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    widget.courseName,
                                    style: AppWidget.CourseName(),
                                  ),
                                ],
                              ),
                              InkWell( 
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LessonsPage(),
                                    ),
                                  );
                                },
                                child: Icon(Icons.arrow_forward_ios, size: 25),
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                size: 20,
                                color: Color(0xFF585555),
                              ),
                              SizedBox(width: 5),
                              Text(
                                widget.courseTutor,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF585555),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 140,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: LinearProgressIndicator(
                                    minHeight: 8,
                                    value: completed_lessons_percentage,
                                    backgroundColor: const Color(0xFFE6E6E6),
                                    color: const Color(0xFF0066FF),
                                  ),
                                ),
                              ),
                              Text(
                                '${widget.progress}/${widget.courseLessons}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF585555),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
