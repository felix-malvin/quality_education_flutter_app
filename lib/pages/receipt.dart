import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar3.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';
import 'package:quality_education_app/commons/color.dart';

class ReceiptPage extends StatefulWidget {
  final EnrolledCourse course;

  const ReceiptPage({Key? key, required this.course}) : super(key: key);

  @override
  _ReceiptPage createState() => _ReceiptPage();
}

class _ReceiptPage extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Receipt'),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 15),

              SizedBox(height: 15),
              _buildLessonSummarySection(),
              _buildPriceDetailSection(),
              _buildPaymentDetailSection(),
            ],
          ),
          _buildBottomSection(media)
        ],
      ),
    );
  }

  
}
