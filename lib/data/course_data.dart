import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/models/badge_model.dart';

List<Course> courses = [
  Course(
    image: 'assets/math_course_1.jpg',
    name: 'Mastering Math',
    category: 'Math',
    categoryBaseColor: 'FFC524',
    duration: '20h 10m',
    totalLessons: 30,
    tutor: 'Budi Hartono',
    price: 160000,
    level: 'Beginner',
    rating: 4.9,
    totalRatings: 200,
    language: 'English',
    totalStudents: '5000+',
    isCertificate: true,
    description:
        'Welcome to Mastering Math, the best place to master mathematics effectively and enjoyably! \n\nWe understand that math is often seen as challenging and difficult. That’s why this course is here to help you grasp mathematical concepts easily, step by step, through interactive and structured learning methods',
    badges: [
      Badge(badgeName: 'Best seller', badgeColor: 'FFC524'),
      Badge(badgeName: 'Recommendation', badgeColor: '00B569'),
    ],
    lessonSections: [
      LessonSection(
        sectionTitle: 'Introduction',
        duration: '45 minutes',
        lessons: ['Introduction to Math', 'Importance of Math in Life'],
      ),
      LessonSection(
        sectionTitle: 'Numbers',
        duration: '1h 30 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Fractions',
        duration: '1h 30 minutes',
        lessons: ['Understanding Fractions', 'Simplifying Fractions '],
      ),
      LessonSection(
        sectionTitle: 'Decimals',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Algebra',
        duration: '1h 30 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Geometry',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Ratios',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Measurement',
        duration: '1h 45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Graphs',
        duration: '1h 13 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
      LessonSection(
        sectionTitle: 'Probability ',
        duration: '45 minutes',
        lessons: ['Number Types', 'Basic Operations'],
      ),
    ],
  ),
];
