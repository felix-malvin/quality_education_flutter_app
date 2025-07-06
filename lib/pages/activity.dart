import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/pages/receipt.dart';
import 'package:quality_education_app/pages/rating.dart';
import 'package:intl/intl.dart';

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

    String formatDate(DateTime dateTime) {
      return DateFormat("MMMM d, y, HH.mm").format(dateTime);
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
              : ListView.separated(
                itemCount: enrolledCourses.length,
                separatorBuilder:
                    (context, index) => Divider(
                      height: 1,
                      color: Colors.grey[300],
                      indent: 30,
                      endIndent: 30,
                    ),
                itemBuilder: (context, index) {
                  final course = enrolledCourses[index];

                  return InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Row: Course Name and Price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Tooltip(
                                    message: course.enrolledCourse.name,
                                    child: SizedBox(
                                      width: 180,
                                      child: Text(
                                        course.enrolledCourse.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '#${course.id}',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                formatRupiah(
                                  (course.enrolledCourse.price * 1.11).toInt(),
                                ),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: CustomColors.primaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          // Bottom Row: Date + Rating Button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatDate(course.enrolledAt),
                                style: TextStyle(
                                  fontSize: 15,
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
                                        fontSize: 18,
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
