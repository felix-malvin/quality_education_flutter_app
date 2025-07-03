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
    Color category_color = Color(
      int.parse('0xFF' + item.enrolledCourse.categoryBaseColor),
    );
    Color category_container_color = Color(
      int.parse('0x17' + item.enrolledCourse.categoryBaseColor),
    );

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
                                    SizedBox(height: 4),
                                    Text(
                                      item.enrolledCourse.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppWidget.CourseName(),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => LessonsPage(
                                            courseId: item.enrolledCourse.id,
                                          ),
                                    ),
                                  );
                                  onReturn(); // panggil callback untuk rebuild
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
                                item.enrolledCourse.tutor,
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
                                    value: completed / total,
                                    backgroundColor: const Color(0xFFE6E6E6),
                                    color: const Color(0xFF0066FF),
                                  ),
                                ),
                              ),
                              Text(
                                '${completed}/${total}',
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
        SizedBox(height: 15),
      ],
    );
  }
}
