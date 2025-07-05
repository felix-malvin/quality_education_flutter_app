import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/subjects.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/models/subject_model.dart';

class QuizPage extends StatefulWidget {
  final Subject subject;

  const QuizPage({super.key, required this.subject});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool quizFinished = false;

  List<String?> selectedAnswers = List.filled(10, null);

  void _submitQuiz() {
    int count = 0;
    for (int i = 0; i < widget.subject.quiz.length; i++) {
      if (selectedAnswers[i] == widget.subject.quiz[i].answer) {
        count++;
      }
    }
    setState(() {
      score = count;
      quizFinished = true;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    final current = widget.subject.quiz[currentQuestionIndex];
    final selected = selectedAnswers[currentQuestionIndex];

    return Scaffold(
      appBar: CustomAppBar(title: 'Quiz'),
      backgroundColor: Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1} of ${widget.subject.quiz.length}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              current.question,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            
          ],
        ),
      ),
    );
  }
}
