import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/pages/course_detail.dart';
import 'package:quality_education_app/data/course_data.dart';
import 'package:quality_education_app/widgets/components/course_card.dart';
import 'package:shimmer/shimmer.dart';

class PopularCoursesPage extends StatelessWidget {
  const PopularCoursesPage({super.key});

  Future<void> _loadCourses() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Popular Courses'),
      body: FutureBuilder<void>(
        future: _loadCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SingleChildScrollView(
              child: Column(
                children: List.generate(courses.length, (index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                      child: Container(
                        width: double.infinity,
                        height: 115,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFFE6E6E6), width: 1),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...courses.map((course) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                      child: CourseCard(
                        course: course,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailPage(course: course),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                  SizedBox(height: 15),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
