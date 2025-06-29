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

  Widget _buildRowContent(String title, content) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: CustomColors.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              content,
              style: TextStyle(
                color: CustomColors.primaryText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection(media) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: media.width,
        height: 0.12 * media.height,
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -6), // Shadow ke atas
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  foregroundColor: CustomColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  "Download E-Receipt",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF9F9F9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
