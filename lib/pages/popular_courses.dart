import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/pages/course_detail.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/data/course_data.dart';
import 'package:shimmer/shimmer.dart';

class PopularCoursesPage extends StatefulWidget {
  const PopularCoursesPage({super.key});

  @override
  _PopularCoursesPage createState() => _PopularCoursesPage();
}

class _PopularCoursesPage extends State<PopularCoursesPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Popular Courses'),
      body: SingleChildScrollView(child: _buildPopularCourseContent()),
    );
  }

  Widget _buildCourse(Course course, VoidCallback onTap) {
    Color badge_name_color = Color(
      int.parse('0xFF' + course.badges[0].badgeColor),
    );
    Color badge_container_color = Color(
      int.parse('0x17' + course.badges[0].badgeColor),
    );

    String formatRupiah(amount) {
      String result = amount.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      );
      return 'Rp$result';
    }

    return Container(
      width: double.infinity,
      height: 115,
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
                width: 95,
                height: 91,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    course.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 80,
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
                                Tooltip(
                                  child: Text(
                                    course.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppWidget.CourseName(),
                                  ),
                                  message: course.name,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      course.duration,
                                      style: AppWidget.CourseDuration(),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 3,
                                      height: 3,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0066FF),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${course.lessonSections.length} lessons",
                                      style: AppWidget.CourseLessons(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: onTap,
                            child: Icon(Icons.arrow_forward_ios, size: 25),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 22,
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: badge_container_color,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                course.badges[0].badgeName,
                                style: AppWidget.Badge(badge_name_color),
                              ),
                            ),
                          ),
                          Text(
                            formatRupiah(course.price),
                            style: AppWidget.CoursePrice(),
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
    );
  }

  Widget _buildPopularCourseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
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
              },
            )
            : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                  child: _buildCourse(course, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseDetailPage(course: course),
                      ),
                    );
                  }),
                );
              },
            ),
        SizedBox(height: 15),
      ],
    );
  }
}
