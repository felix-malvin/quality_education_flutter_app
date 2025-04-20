import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/signup.dart';
import 'package:quality_education_app/commons/color.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPage createState() => _OnboardingPage();
}

class _OnboardingPage extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              _buildPageViewContent(),
              _buildPageViewNavigator(),
            ],
          ),
          _buildSkipButton(context)
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imagePath,
    required Widget textWidget1,
    required Widget textWidget2,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 290),
          SizedBox(height: 25),
          textWidget1,
          textWidget2,
          SizedBox(height: 10),
          SizedBox(
            width: 330,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.secondaryText,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 70),
        ],
      ),
    );
  }

  Widget _buildTitle(String normalText, String highlightedText) {
    return Text.rich(
      TextSpan(
        text: normalText,
        style: TextStyle(
          fontSize: 26,
          color: CustomColors.primaryText,
          fontWeight: FontWeight.w800,
        ),
        children: [
          TextSpan(
            text: highlightedText,
            style: TextStyle(color: CustomColors.secondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 26,
        color: CustomColors.secondary,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildPageViewContent() {
    return Expanded(
      child: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _buildPage(
            imagePath: 'assets/onboarding_1.png',
            textWidget1: _buildTitle("Discover Your ", "Learning"),
            textWidget2: _buildSubTitle("Adventure"),
            description:
                "Start your journey to quality education today and unlock your full potential.",
          ),
          _buildPage(
            imagePath: 'assets/onboarding_2.png',
            textWidget1: _buildTitle("Unlock Your ", "Skill and"),
            textWidget2: _buildSubTitle("Potential"),
            description:
                "Gain access to high-quality resources and develop the expertise you need to succeed.",
          ),
          _buildPage(
            imagePath: 'assets/onboarding_3.png',
            textWidget1: _buildTitle("Earn Your ", "Certificate of"),
            textWidget2: _buildSubTitle("Achievement"),
            description:
                "Complete your courses and earn a certificate that showcases your skills and commitment.",
          ),
        ],
      ),
    );
  }

  Widget _buildPageViewPreviousButton() {
    if (_currentPage > 0) {
      return TextButton(
        onPressed: () {
          _pageController.previousPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1.5, color: CustomColors.primary),
          ),
          child: Icon(Icons.arrow_back, color: CustomColors.primary),
        ),
      );
    } else {
      return SizedBox(width: 45);
    }
  }

  Widget _buildPageViewIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: _currentPage == index ? 12 : 8,
          height: _currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color:
                _currentPage == index
                    ? CustomColors.secondary
                    : CustomColors.secondaryText,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  Widget _buildPageViewNextButton() {
    return TextButton(
      onPressed: () {
        if (_currentPage < 2) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.primary,
        ),
        child: Icon(Icons.arrow_forward, color: CustomColors.white),
      ),
    );
  }

  Widget _buildPageViewNavigator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 72, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPageViewPreviousButton(),
          _buildPageViewIndicator(),
          _buildPageViewNextButton(),
        ],
      ),
    );
  }
}

Widget _buildSkipButton(context) {
  return Positioned(
    top: 50,
    right: 30,
    child: TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignupPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.transparent,
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            color: CustomColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
  );
}
