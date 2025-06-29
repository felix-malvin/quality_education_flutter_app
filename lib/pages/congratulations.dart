import 'package:flutter/material.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';
import 'package:quality_education_app/pages/receipt.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/widgets/layouts/main_layout.dart';
import 'package:quality_education_app/models/enrolled_course_model.dart';

class CongratulationsPage extends StatefulWidget {
  final EnrolledCourse course;

  const CongratulationsPage({super.key, required this.course});

  @override
  _CongratulationsPage createState() => _CongratulationsPage();
}

class _CongratulationsPage extends State<CongratulationsPage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.white,
      body: Stack(
        children: [_buildMainSection(media), _buildBottomSection(media)],
      ),
    );
  }

  Widget _buildMainSection(media) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 0.2 * media.height),
          Container(
            padding: EdgeInsets.all(10),
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.primary,
            ),
            child: Icon(Icons.check, size: 120, color: CustomColors.white),
          ),
          SizedBox(height: 25),
          Text(
            'Congratulations!',
            style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 15),
          Text(
            'You have succesfully made payment and enrolled the course',
            style: TextStyle(
              color: CustomColors.secondaryText,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomSection(media) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: media.width,
        height: 0.17 * media.height,
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
                  "View E-Receipt",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF9F9F9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => MainLayout()),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.white,
                  foregroundColor: CustomColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  "Back to home",
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.primary,
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
