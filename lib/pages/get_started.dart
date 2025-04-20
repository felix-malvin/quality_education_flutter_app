import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/signin.dart';
import 'package:quality_education_app/pages/onboarding.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Positioned(
            top: -10,
            left: 16,
            child: Image.asset('assets/get_started_image.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('assets/get_started_component_1.png'),
          ),
          Positioned(
            top: 530,
            child: Container(
              width: 390,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Get Started on ',
                          style: TextStyle(
                            color: const Color(0xFF3F3D56),
                            fontSize: 26,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: 'Your',
                          style: TextStyle(
                            color: const Color(0xFFFFC424),
                            fontSize: 26,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Learning Journey',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFFFC424),
                      fontSize: 26,
                      fontFamily: 'Mukta',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 301.02,
                    child: Text(
                      'Unlock endless possibilities and explore a world of knowledge.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xB22E2E2E),
                        fontSize: 16,
                        fontFamily: 'Mukta',
                        fontWeight: FontWeight.w400,
                        height: 1.25,
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => OnboardingPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF0066FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 6,
                        ),
                      ),
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFF9F9F9),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                          color: Color(0xFF585555),
                          fontSize: 15,
                          fontFamily: 'Mukta',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SigninPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Color(0xFF0066FF),
                            fontSize: 15,
                            fontFamily: 'Mukta',
                            fontWeight: FontWeight.w400,
                          ),
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
    );
  }
}