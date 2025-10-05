import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/signin.dart';
import 'package:quality_education_app/pages/onboarding.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return SingleChildScrollView(
              child: SizedBox(
                height: screenHeight,
                child: Stack(
                  children: [
                    // Top Image
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/get_started_image.png',
                        width: screenWidth,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Bottom Decorative Image
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/get_started_component_1.png',
                        width: screenWidth,
                        fit: BoxFit.fitWidth,
                      ),
                    ),

                    // Content
                    Positioned(
                      bottom: screenHeight * 0.08, // Agak naik dari bawah
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Get Started on ',
                                    style: TextStyle(
                                      color: Color(0xFF3F3D56),
                                      fontSize: 26,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Your',
                                    style: TextStyle(
                                      color: Color(0xFFFFC424),
                                      fontSize: 26,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text(
                              'Learning Journey',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFFFC424),
                                fontSize: 26,
                                fontFamily: 'Mukta',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Unlock endless possibilities and explore a world of knowledge.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xB22E2E2E),
                                  fontSize: 16,
                                  fontFamily: 'Mukta',
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => OnboardingPage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0066FF),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 8), // lebih kecil
                                ),
                                child: const Text(
                                  "Get Started",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFFF9F9F9),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: Color(0xFF585555),
                                    fontSize: 15,
                                    fontFamily: 'Mukta',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => SigninPage()),
                                    );
                                  },
                                  child: const Text(
                                    'Sign In',
                                    style: TextStyle(
                                      color: Color(0xFF0066FF),
                                      fontSize: 15,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w500,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
