import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';

class PopularCoursesPage extends StatefulWidget {
  const PopularCoursesPage({super.key});

  @override
  _PopularCoursesPage createState() => _PopularCoursesPage();
}

class _PopularCoursesPage extends State<PopularCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Popular Courses'),
      body: SingleChildScrollView(child: _buildPopularCourseContent()),
    );
  }

  Widget _buildCourse(
    String image,
    String courseName,
    String courseDuration,
    int courseLessons,
    int coursePrice,
    String badgeName,
    String badgeColor,
  ) {
    Color badge_name_color = Color(int.parse('0xFF' + badgeColor));
    Color badge_container_color = Color(int.parse('0x17' + badgeColor));

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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 95,
                height: 91,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(courseName, style: AppWidget.CourseName()),
                            Row(
                              children: [
                                Text(
                                  courseDuration,
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
                                  "$courseLessons lessons",
                                  style: AppWidget.CourseLessons(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.arrow_forward_ios),
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
                              badgeName,
                              style: AppWidget.Badge(badge_name_color),
                            ),
                          ),
                        ),
                        Text(
                          formatRupiah(coursePrice),
                          style: AppWidget.CoursePrice(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopularCourseContent() {
    final popularCourses = [
      {
        'name': 'Mastering Math',
        'image': 'assets/math_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 30,
        'price': 160000,
        'badge': 'Best seller',
        'badge_color': 'FFC524',
      },
      {
        'name': 'Physics for Beginner',
        'image': 'assets/physics_course_1.jpg',
        'duration': '15h 45m',
        'lessons': 25,
        'price': 125000,
        'badge': 'Beginner Friendly',
        'badge_color': '2196F3',
      },
      {
        'name': 'Advance Chemistry',
        'image': 'assets/chemistry_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 40,
        'price': 250000,
        'badge': 'Expert Choice',
        'badge_color': '9C27B0',
      },
      {
        'name': 'Cell to System',
        'image': 'assets/biology_course_1.jpg',
        'duration': '09h 45m',
        'lessons': 22,
        'price': 169000,
        'badge': 'New Arrival',
        'badge_color': '00BCD4',
      },
      {
        'name': 'Mastering Math',
        'image': 'assets/math_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 30,
        'price': 160000,
        'badge': 'Best seller',
        'badge_color': 'FFC524',
      },
      {
        'name': 'Physics for Beginner',
        'image': 'assets/physics_course_1.jpg',
        'duration': '15h 45m',
        'lessons': 25,
        'price': 125000,
        'badge': 'Beginner Friendly',
        'badge_color': '2196F3',
      },
      {
        'name': 'Advance Chemistry',
        'image': 'assets/chemistry_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 40,
        'price': 250000,
        'badge': 'Expert Choice',
        'badge_color': '9C27B0',
      },
      {
        'name': 'Cell to System',
        'image': 'assets/biology_course_1.jpg',
        'duration': '09h 45m',
        'lessons': 22,
        'price': 169000,
        'badge': 'New Arrival',
        'badge_color': '00BCD4',
      },
      {
        'name': 'Mastering Math',
        'image': 'assets/math_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 30,
        'price': 160000,
        'badge': 'Best seller',
        'badge_color': 'FFC524',
      },
      {
        'name': 'Physics for Beginner',
        'image': 'assets/physics_course_1.jpg',
        'duration': '15h 45m',
        'lessons': 25,
        'price': 125000,
        'badge': 'Beginner Friendly',
        'badge_color': '2196F3',
      },
      {
        'name': 'Advance Chemistry',
        'image': 'assets/chemistry_course_1.jpg',
        'duration': '20h 10m',
        'lessons': 40,
        'price': 250000,
        'badge': 'Expert Choice',
        'badge_color': '9C27B0',
      },
      {
        'name': 'Cell to System',
        'image': 'assets/biology_course_1.jpg',
        'duration': '09h 45m',
        'lessons': 22,
        'price': 169000,
        'badge': 'New Arrival',
        'badge_color': '00BCD4',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children:
                popularCourses.map((course) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildCourse(
                      course['image'] as String,
                      course['name'] as String,
                      course['duration'] as String,
                      course['lessons'] as int,
                      course['price'] as int,
                      course['badge'] as String,
                      course['badge_color'] as String,
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
