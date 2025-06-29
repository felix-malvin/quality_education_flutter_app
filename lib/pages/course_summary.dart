import 'package:flutter/material.dart';
import 'package:quality_education_app/models/payment_method_model.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/pages/payment_methods.dart';
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
  PaymentMethod selectedMethod = PaymentMethod(
    name: "OVO",
    imagePath: "assets/ovo_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var finalPrice = (1.11 * widget.course.price).toInt();

    void _navigateAndSelectMethod() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => PaymentMethodPage(selectedMethod: selectedMethod),
        ),
      );

      if (result != null && result is PaymentMethod) {
        setState(() {
          selectedMethod = result;
        });
      }
    }

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
                _buildSectionDivider(media),
                _buildCourseDetailSection(),
                _buildSectionDivider(media),
                _buildPriceSummarySection(),
                _buildPaymentDetailSection(
                  selectedMethod,
                  _navigateAndSelectMethod,
                ),
              ],
            ),
          ),
          _buildFinalPriceSection(media, finalPrice),
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

  Widget _buildSectionDivider(media) {
    return Container(
      width: media.width,
      height: 7,
      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
    );
  }

  Widget _buildCourseDetailSection() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Course Detail',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF2E2E2E),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.course.language,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lessons',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${widget.course.lessonSections.length}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Level',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                widget.course.level,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceSummarySection() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Summary',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF2E2E2E),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amount',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${widget.course.price}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax (11%)',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '${widget.course.price * 0.11}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2E2E2E),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentDetailSection(selectedMethod, method) {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 20, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Detail',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF2E2E2E),
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(selectedMethod.imagePath, width: 30),
                  SizedBox(width: 15),
                  Text(
                    selectedMethod.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.secondaryText,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: method,
                child: Text(
                  "Change",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF0066FF),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFinalPriceSection(media, finalPrice) {
    String formatRupiah(amount) {
      String result = amount.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      );
      return 'Rp$result';
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: media.width,
        height: 0.12 * media.height,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Final price',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      formatRupiah(finalPrice),
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF0066FF),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      enrolledCourses.add(
                        EnrolledCourse(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          enrolledAt: DateTime.now(),
                          paymentMethod: selectedMethod.name,
                          progress: 0,
                          enrolledCourse: widget.course,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CongratulationsPage(course: enrolledCourse),
                        ),
                      );
                      print(enrolledCourses);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFF0066FF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 15,
                      ),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFF9F9F9),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  

  


}
