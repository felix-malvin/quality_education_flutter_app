import 'package:flutter/material.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';

class LessonDetailPage extends StatefulWidget {
  final String courseId;
  final int index;

  const LessonDetailPage({
    super.key,
    required this.courseId,
    required this.index,
  });

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage> {
  late ScrollController _scrollController;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (!_isCompleted &&
        _scrollController.offset >=
            _scrollController.position.maxScrollExtent) {
      setState(() {
        _isCompleted = true;
        print(widget.courseId);
        print(widget.index);
        final course = enrolledCourses.firstWhere(
          (e) => e.enrolledCourse.id == widget.courseId,
        );
        course.progress[widget.index] = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Lesson'),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Text('Lesson Detail Page'),
      ),
    );
  }
}
