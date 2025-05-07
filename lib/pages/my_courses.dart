import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar2.dart';
import 'package:quality_education_app/widgets/ongoing_course_card.dart';
import 'package:quality_education_app/widgets/completed_course_card.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  _MyCoursePage createState() => _MyCoursePage();
}

class _MyCoursePage extends State<MyCoursePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'My Courses'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              labelColor: Color(0xFF0066FF),
              unselectedLabelColor: Color(0xFF2E2E2E),
              indicatorColor: Color(0xFF0066FF),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 2),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    child: Text(
                      "Ongoing",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Mukta',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                enrolledCourses.isEmpty
                    ? Center(
                      child: Text(
                        "No classes have been enrolled yet.",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 30,
                      ),
                      child: ListView.builder(
                        itemCount: enrolledCourses.length,
                        itemBuilder: (context, index) {
                          final enrolled = enrolledCourses[index];
                          return OngoingCourseCard(
                            image: enrolled.enrolledCourse.image,
                            courseName: enrolled.enrolledCourse.name,
                            courseTutor: enrolled.enrolledCourse.tutor,
                            courseCategory: enrolled.enrolledCourse.category,
                            courseLessons: enrolled.enrolledCourse.totalLessons,
                            baseColor:
                                enrolled.enrolledCourse.categoryBaseColor,
                            progress: 0,
                            course: enrolled.enrolledCourse,
                          );
                        },
                      ),
                    ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    children: [
                      CompletedCourseCard(
                        image: 'assets/math_course_1.jpg',
                        courseName: 'Mastering Math',
                        courseTutor: 'Budi Hartono',
                        courseLessons: 30,
                        courseCategory: 'Math',
                        baseColor: 'FFC524',
                      ),
                      SizedBox(height: 15),
                      CompletedCourseCard(
                        image: 'assets/physics_course_1.jpg',
                        courseName: 'Physics for Beginner',
                        courseTutor: 'Victor Dorian',
                        courseLessons: 25,
                        courseCategory: 'Physics',
                        baseColor: '0A192F',
                      ),
                      SizedBox(height: 15),
                      CompletedCourseCard(
                        image: 'assets/chemistry_course_1.jpg',
                        courseName: 'Advance Chemistry',
                        courseTutor: 'James Manny',
                        courseLessons: 25,
                        courseCategory: 'Chemistry',
                        baseColor: '800000',
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
