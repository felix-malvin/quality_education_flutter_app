import 'package:quality_education_app/models/badge_model.dart';

class Course {
  final String id;
  final String image;
  final String name;
  final String category;
  final String categoryBaseColor;
  final String duration;
  final String tutor;
  final double price;
  final String level;
  final double rating;
  final int totalRatings;
  final String language;
  final String totalStudents;
  final bool isCertificate;
  final String description;
  final List<Badge> badges;
  final List<LessonSection> lessonSections;

  Course({
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.categoryBaseColor,
    required this.duration,
    required this.tutor,
    required this.price,
    required this.level,
    required this.rating,
    required this.totalRatings,
    required this.language,
    required this.totalStudents,
    required this.isCertificate,
    required this.description,
    required this.badges,
    required this.lessonSections,
  });
}

class LessonSection {
  final String sectionTitle;
  final String duration;
  final List<String> lessons;

  LessonSection({
    required this.sectionTitle,
    required this.duration,
    required this.lessons,
  });
}