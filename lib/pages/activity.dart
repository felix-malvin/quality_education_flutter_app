import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/pages/receipt.dart';
import 'package:quality_education_app/pages/rating.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    String formatRupiah(amount) {
      String result = amount.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      );
      return 'Rp$result';
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Activity'),
      body:
          enrolledCourses.isEmpty
              ? Center(
                child: Text(
                  "No activities yet.",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
              : ListView.builder(
                itemCount: enrolledCourses.length,
                itemBuilder: (context, index) {
                  final course = enrolledCourses[index];

                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.enrolledCourse.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '#${course.id}',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              // Price
                              Text(
                                formatRupiah(
                                  (course.enrolledCourse.price * 1.11).toInt(),
                                ),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.primaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Row: Date + Give Rating Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'June 18, 2025, 22.34',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => RatingPage(
                                            course: course.enrolledCourse,
                                          ),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: CustomColors.primary,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Give Rating',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: CustomColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReceiptPage(course: course),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
