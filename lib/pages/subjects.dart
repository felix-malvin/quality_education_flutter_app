import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/components/subject_card.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/data/subject_data.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            return SubjectCard(subject: subject);
          }).toList(),
        ),
      ),
    );
  }
}
