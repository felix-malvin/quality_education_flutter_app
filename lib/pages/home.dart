import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/pages/popular_courses.dart';
import 'package:quality_education_app/commons/color.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

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
      backgroundColor: CustomColors.white,
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
              Text(
                'Hello, Gojo Satoru',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: CustomColors.primaryText,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Let`s start learning! 📚',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.primaryText,
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/avatar_logo.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 43,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search here",
                  prefixIcon: Icon(Icons.search, color: CustomColors.primary),
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
          SizedBox(width: 10),
          SizedBox(
            height: 43,
            child: ElevatedButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                backgroundColor: Color(0xFF0066FF),
                foregroundColor: Color(0xFFF9F9F9),
                padding: EdgeInsets.symmetric(horizontal: 6),
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
                                ? CustomColors.primary
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

  Widget _buildSubjectIcon(String name, String image) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0x89D9ECFB),
          ),
          child: Center(child: Image.asset(image, width: 35)),
        ),
        SizedBox(height: 6),
        Text(name, style: AppWidget.SubjectName(), textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildSubjectScroll() {
    final subjects = [
      {'name': 'Math', 'image': 'assets/math_logo_primary.png'},
      {'name': 'Biology', 'image': 'assets/biology_logo_primary.png'},
      {'name': 'Physics', 'image': 'assets/physics_logo_primary.png'},
      {'name': 'Chemistry', 'image': 'assets/chemistry_logo_primary.png'},
      {'name': 'Economy', 'image': 'assets/economy_logo_primary.png'},
      {'name': 'Geography', 'image': 'assets/geography_logo_primary.png'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children:
            subjects.asMap().entries.map((entry) {
              final index = entry.key;
              final subject = entry.value;

              return Row(
                children: [
                  if (index != 0) SizedBox(width: 36),
                  _buildSubjectIcon(subject['name']!, subject['image']!),
                ],
              );
            }).toList(),
      ),
    );
  }

  Widget _buildSubjectsContent() {
    return Column(
      children: [
        _buildContentHeader('Subjects', () {}),
        SizedBox(height: 10),
        _buildSubjectScroll(),
      ],
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
                    image,
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
    ];

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
