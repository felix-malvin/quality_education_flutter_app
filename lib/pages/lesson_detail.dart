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
    final content = List.generate(
      50,
      (i) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text('Konten materi paragraf ${i + 1}...',
            style: TextStyle(fontSize: 16)),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Lessons'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        child: ListView(
          controller: _scrollController,
          children: [
            Text(
              'Judul Materi ${widget.index + 1}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ...content,
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
