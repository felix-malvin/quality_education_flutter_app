import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/models/subject_model.dart';
import 'package:quality_education_app/widgets/layouts/main_layout.dart';

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
    _showResult();
  }

  void _showResult() {
    showDialog(
      context: context,
      builder:
          (_) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.emoji_events, size: 64, color: Colors.orange),
                  SizedBox(height: 12),
                  Text(
                    'Quiz Completed!',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Your score is $score / ${widget.subject.quiz.length}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MainLayout()),
                        );
                      },
                      icon: Icon(Icons.check_circle_outline),
                      label: Text('Finish'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
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
            const SizedBox(height: 24),
            ...current.options.map<Widget>((opt) {
              bool isSelected = opt == selected;
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? Color.fromARGB(30, 0, 102, 255)
                          : Colors.white,
                  border: Border.all(
                    color:
                        isSelected
                            ? CustomColors.primary
                            : Colors.grey.shade300,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    if (isSelected)
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    opt,
                    style: TextStyle(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? CustomColors.primary : Colors.black87,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedAnswers[currentQuestionIndex] = opt;
                    });
                  },
                ),
              );
            }).toList(),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed:
                        currentQuestionIndex > 0
                            ? () => setState(() => currentQuestionIndex--)
                            : null,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: const BorderSide(color: Color(0xff0066FF)),
                    ),
                    child: const Text(
                      'Previous',
                      style: TextStyle(
                        color: Color(0xff0066FF),
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: ElevatedButton(
                    onPressed:
                        currentQuestionIndex < widget.subject.quiz.length - 1
                            ? () => setState(() => currentQuestionIndex++)
                            : selectedAnswers.contains(null)
                            ? null
                            : _submitQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff0066FF),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      currentQuestionIndex < widget.subject.quiz.length - 1
                          ? 'Next'
                          : 'Submit',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
