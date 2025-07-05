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
}
