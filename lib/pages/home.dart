import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/profile.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/pages/popular_courses.dart';
import 'package:quality_education_app/pages/subjects.dart';
import 'package:quality_education_app/pages/course_detail.dart';
import 'package:quality_education_app/pages/search.dart';
import 'package:quality_education_app/data/course_data.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/pages/detail_subject.dart';
import 'package:quality_education_app/data/subject_data.dart';
import 'package:quality_education_app/widgets/components/course_card.dart';
import 'package:quality_education_app/db/db_helper.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool isLoading = true;
  final dbHelper = DBHelper();

  final List<String> _images = [
    'assets/carousel_image_1.jpg',
    'assets/carousel_image_2.jpg',
    'assets/carousel_image_3.jpg',
    'assets/carousel_image_4.jpg',
  ];
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _startAutoSlide();
    _setStartLoading();
  }

  void _setStartLoading() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 4), (Timer timer) {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHomeHeader(),
            SizedBox(height: 20),
            _buildSearchBox(),
            SizedBox(height: 20),
            _buildHomeCarousel(),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSubjectsContent(),
                    SizedBox(height: 20),
                    _buildPopularCourseContent(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              child: AbsorbPointer(
                child: SizedBox(
                  height: 43,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here",
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.primary,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFF0F1F5),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          SizedBox(
            height: 43,
            child: ElevatedButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Color(0xFF0066FF),
                foregroundColor: Color(0xFFF9F9F9),
                padding: EdgeInsets.symmetric(horizontal: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Icon(Icons.filter_list, size: 24),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<Map<String, dynamic>?>(
                future: dbHelper.getProfile(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  final profile = snapshot.data!;
                  return Text(
                    "Hello, ${profile['name']}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              SizedBox(height: 3),
              Text(
                'Lets start learning! 📚',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('assets/avatar_logo.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHomeCarousel() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 194,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentIndex == index ? 14 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color:
                            _currentIndex == index
                                ? Color(0xFF0066FF)
                                : Color(0xFFF9F9F9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSubjectScroll() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children:
            subjects.asMap().entries.take(6).map((entry) {
              final index = entry.key;
              final subject = entry.value;
              return Row(
                children: [
                  if (index != 0) SizedBox(width: 36),
                  _buildSubjectIcon(subject.title, subject.imagePrimary, () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                SubjectDetailPage(subject: entry.value),
                      ),
                    );
                  }),
                ],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildSubjectIcon(String name, String image, VoidCallback onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Container(
            padding: EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0x89D9ECFB),
            ),
            child: Center(child: Image.asset(image, width: 35)),
          ),
          onTap: onTap,
        ),
        SizedBox(height: 6),
        Text(name, style: AppWidget.SubjectName(), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildContentHeader(String title, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: AppWidget.HomeSubtitle()),
          InkWell(
            onTap: onTap,
            child: Text('See all', style: AppWidget.SecondaryText()),
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectsContent() {
    return Column(
      children: [
        _buildContentHeader('Subjects', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SubjectsPage()),
          );
        }),
        SizedBox(height: 10),
        _buildSubjectScroll(),
      ],
    );
  }

  Widget _buildPopularCourseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentHeader('Popular Courses', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PopularCoursesPage()),
          );
        }),
        SizedBox(height: 10),
        isLoading
            ? ListView.builder(
              padding: const EdgeInsets.only(top: 0),
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
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 15, left: 30, right: 30),
                  child: CourseCard(
                    course: course,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CourseDetailPage(course: course),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      ],
    );
  }
}
