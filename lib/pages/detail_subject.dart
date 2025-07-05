import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/models/subject_model.dart';
import 'package:quality_education_app/pages/quiz.dart';

class SubjectDetailPage extends StatelessWidget {
  final Subject subject;

  const SubjectDetailPage({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.white,
      appBar: CustomAppBar(title: subject.title),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        child: Column(
          children: [
            buildCard(
              title: "Learning",
              backgroundImage: 'assets/learning_banner.png',
              overlayColor: Color(0x17DDA200),
              icon: Icons.arrow_forward,
              onTap: () {},
            ),
            const SizedBox(height: 16),
            buildCard(
              title: "Exercise",
              backgroundImage: 'assets/exercise_banner.png',
              overlayColor: Color(0x1700B66A),
              icon: Icons.arrow_forward,
              onTap: () {
                // Navigasi ke halaman exercise
              },
            ),
            const SizedBox(height: 16),
            buildCard(
              title: "Quiz",
              backgroundImage: 'assets/challenge_banner.png',
              overlayColor: Color(0x17FF0000),
              icon: Icons.arrow_forward,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(subject: subject),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String backgroundImage,
    required Color overlayColor,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 127,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(0, 3), // bayangan jatuh ke bawah
            ),
          ],
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Gambar latar
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(backgroundImage, fit: BoxFit.cover),
            ),
            // Overlay transparan
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: overlayColor.withOpacity(0.6),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(icon, color: Colors.black, size: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
