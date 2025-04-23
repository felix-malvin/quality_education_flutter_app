import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
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
                  color: CustomColors.primary,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Let`s start learning! 📚',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.primary,
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
                  prefixIcon: Icon(Icons.search, color: Color(0xFF0066FF)),
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
}
