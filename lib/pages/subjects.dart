import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/components/subject_card.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      {
        "title": "Math",
        "image": "assets/math_logo_secondary.png",
        "baseColor": Colors.orange,
        "quarterColor": Colors.amber,
      },
      {
        "title": "Physics",
        "image": "assets/physics_logo_secondary.png",
        "baseColor": Colors.indigo.shade900,
        "quarterColor": Colors.grey.shade400,
      },
      {
        "title": "Biology",
        "image": "assets/biology_logo_secondary.png",
        "baseColor": Colors.green,
        "quarterColor": Colors.brown.shade400,
      },
      {
        "title": "Chemistry",
        "image": "assets/chemistry_logo_secondary.png",
        "baseColor": Colors.red.shade700,
        "quarterColor": Colors.orange.shade100,
      },
      {
        "title": "Economy",
        "image": "assets/economy_logo_secondary.png",
        "baseColor": Colors.blue.shade900,
        "quarterColor": Colors.yellow.shade600,
      },
      {
        "title": "Geography",
        "image": "assets/geography_logo_secondary.png",
        "baseColor": Colors.brown,
        "quarterColor": Colors.yellow.shade600,
      },
      {
        "title": "History",
        "image": "assets/history_logo_secondary.png",
        "baseColor": Colors.teal.shade700,
        "quarterColor": Colors.green.shade300,
      }
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Subjects'),
      body: Container(
        child: GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 16,
          childAspectRatio: 1.4,
          children: subjects.map((subject) {
            return SubjectCard(
              title: subject['title'] as String,
              image: subject['image'] as String,
              baseColor: subject['baseColor'] as Color,
              quarterColor: subject['quarterColor'] as Color,
            );
          }).toList(),
        ),
      ),
    );
  }
}
