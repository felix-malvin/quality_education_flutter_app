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
      body: Center(child: Text('Subjects Page'),)
    );
  }
}
