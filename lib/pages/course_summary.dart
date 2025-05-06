import 'package:flutter/material.dart';

import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/models/course_model.dart';

import 'package:quality_education_app/pages/congratulations.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';
import 'package:quality_education_app/commons/color.dart';

class CourseSummaryPage extends StatefulWidget {
  final Course course;

  const CourseSummaryPage({Key? key, required this.course}) : super(key: key);

  @override
  _CourseSummaryPage createState() => _CourseSummaryPage();
}

class _CourseSummaryPage extends State<CourseSummaryPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Course Summary'),
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSummaryHeader(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 30, right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 130,
            height: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.course.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse('0x17' + widget.course.badges[0].badgeColor),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        widget.course.badges[0].badgeName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(
                            int.parse(
                              '0xFF' + widget.course.badges[0].badgeColor,
                            ),
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse('0x17' + widget.course.badges[1].badgeColor),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        widget.course.badges[1].badgeName,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(
                            int.parse(
                              '0xFF' + widget.course.badges[1].badgeColor,
                            ),
                          ),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                widget.course.name,
                style: TextStyle(
                  color: Color(0xFF2E2E2E),
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Color(0xFF585555),
                    size: 20,
                  ),
                  SizedBox(width: 3),
                  Text(
                    widget.course.tutor,
                    style: TextStyle(
                      color: Color(0xFF585555),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                'Rp 160.000',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF0066FF),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  

  

  

  


}
