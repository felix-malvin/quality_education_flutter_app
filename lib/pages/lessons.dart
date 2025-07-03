import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/pages/lesson_detail.dart';
import 'package:quality_education_app/commons/color.dart';

class LessonsPage extends StatefulWidget {
  final String courseId;

  const LessonsPage({super.key, required this.courseId});

  @override
  _LessonsPage createState() => _LessonsPage();
}

class _LessonsPage extends State<LessonsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late EnrolledCourse enrolledCourse;
  late List<String> allLessons;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    enrolledCourse = enrolledCourses.firstWhere(
      (e) => e.enrolledCourse.id == widget.courseId,
    );

    allLessons =
        enrolledCourse.enrolledCourse.lessonSections
            .expand((section) => section.lessons)
            .toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Course'),
      body: Stack(
        children: [
          Column(
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 4,
                        ),
                        child: Text(
                          "Lessons",
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
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 4,
                        ),
                        child: Text(
                          "Certificate",
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
                    _buildPageViewLessonSection(media),
                    _buildUnderDevelopmentPage(),
                  ],
                ),
              ),
            ],
          ),
          _buildBottomSection(media),
        ],
      ),
    );
  }

  Widget _buildUnderDevelopmentPage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.construction, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'This page is under development',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: CustomColors.primaryText,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please check back later.',
              style: TextStyle(fontSize: 16, color: CustomColors.secondaryText),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(media) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: media.width,
        height: 0.12 * media.height,
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -6), // Shadow ke atas
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  foregroundColor: CustomColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  "Rate this course",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF9F9F9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildPageViewLessonSection(media) {
    int lessonCounter = 1;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: media.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2E2E2E),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                        ),
                        children: [
                          TextSpan(text: 'Lessons '),
                          TextSpan(
                            text:
                                '(${enrolledCourse.enrolledCourse.lessonSections.length})',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0066FF),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mukta',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          enrolledCourse.enrolledCourse.lessonSections.length,
                      itemBuilder: (context, sectionIndex) {
                        var section =
                            enrolledCourse
                                .enrolledCourse
                                .lessonSections[sectionIndex];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Section ${sectionIndex + 1} - ${section.sectionTitle}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF585555),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  section.duration,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF0066FF),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: section.lessons.length,
                              itemBuilder: (context, lessonIndex) {
                                int globalLessonNumber = lessonCounter++;
                                String lessonNumberFormatted =
                                    globalLessonNumber.toString().padLeft(
                                      2,
                                      '0',
                                    );

                                String globalLessonTitle =
                                    allLessons[globalLessonNumber - 1];

                                return Container(
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF9F9F9),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: const Color(0xFFE6E6E6),
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 9,
                                      horizontal: 14,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0x89D9ECFB),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  lessonNumberFormatted,
                                                  style: const TextStyle(
                                                    color: Color(0xFF0066FF),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 15),
                                            Text(
                                              globalLessonTitle,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF585555),
                                              ),
                                            ),
                                          ],
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (_) => LessonDetailPage(
                                                      courseId: widget.courseId,
                                                      index:
                                                          globalLessonNumber -
                                                          1,
                                                    ),
                                              ),
                                            );
                                            setState(() {});
                                          },
                                          child: const Icon(
                                            Icons.play_circle,
                                            size: 30,
                                            color: Color(0xFF0066FF),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
