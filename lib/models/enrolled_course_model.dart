import 'package:quality_education_app/models/course_model.dart';

class EnrolledCourse {
  final String id;
  final DateTime enrolledAt;
  final String paymentMethod;
  final List<bool> progress;
  final Course enrolledCourse;

  EnrolledCourse({
    required this.id,
    required this.enrolledAt,
    required this.paymentMethod,
    required this.progress,
    required this.enrolledCourse,
  });
}

