import 'package:flutter/material.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/pages/course_summary.dart';

class CourseDetailPage extends StatefulWidget {
  final Course course;

  const CourseDetailPage({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailPageState createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int lessonCounter = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    String formatRupiah(int amount) {
      String result = amount.toString().replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
        (Match match) => '${match[1]}.',
      );
      return 'Rp$result';
    }

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            widget.course.image,
            width: media.width,
            height: 0.7 * media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: 0.8 * media.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2E2E2E),
                  Colors.transparent,
                  Color(0xFF2E2E2E),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.7 * media.width - 60),
                    Container(
                      width: media.width,
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0.7 * media.width - 60),
                          Container(
                            width: media.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 22),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(
                                            int.parse(
                                              '0x17' +
                                                  widget
                                                      .course
                                                      .badges[0]
                                                      .badgeColor,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.course.badges[0].badgeName,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(
                                                int.parse(
                                                  '0xFF' +
                                                      widget
                                                          .course
                                                          .badges[0]
                                                          .badgeColor,
                                                ),
                                              ),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 2,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(
                                            int.parse(
                                              '0x17' +
                                                  widget
                                                      .course
                                                      .badges[1]
                                                      .badgeColor,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            widget.course.badges[1].badgeName,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(
                                                int.parse(
                                                  '0xFF' +
                                                      widget
                                                          .course
                                                          .badges[1]
                                                          .badgeColor,
                                                ),
                                              ),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Text(
                                    widget.course.name,
                                    style: TextStyle(
                                      color: Color(0xFF2E2E2E),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.book,
                                            color: Color(0xFF585555),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            '${widget.course.totalLessons} lessons',
                                            style: TextStyle(
                                              color: Color(0xFF585555),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xFF585555),
                                            size: 20,
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            '${widget.course.rating} (${widget.course.totalRatings} reviews)',
                                            style: TextStyle(
                                              color: Color(0xFF585555),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                      height: media.height * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TabBar(
                              controller: _tabController,
                              isScrollable: false,
                              labelColor: Color(0xFF0066FF),
                              unselectedLabelColor: Color(0xFF2E2E2E),
                              indicatorColor: Color(0xFF0066FF),
                              indicatorPadding: const EdgeInsets.symmetric(
                                horizontal: 2,
                              ),
                              labelStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              tabs: [
                                _buildTabName('About'),
                                _buildTabName('Lesson'),
                                _buildTabName('Review'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                _buildPageViewAboutSection(media)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildBottomSection(media, formatRupiah),
        ],
      ),
    );
  }

  Widget _buildTabName(String name) {
    return Tab(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'Mukta',
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewAboutSection(media) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: media.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Course',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.course.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF585555),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What We Offer',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '✅ Structured Lessons – From basic to advanced topics, organized for better understanding. \n✅ Interactive Video Lessons – Clear explanations with engaging visual illustrations. \n✅ Practice Problems & Solutions – A variety of exercises with detailed explanations to sharpen your skills. \n✅ Flexible Access – Learn anytime, anywhere, at your own pace.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF585555),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(media, func) {
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
                      'Total price',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      func(widget.course.price),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CourseSummaryPage(),
                        ),
                      );
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
                      "Enroll Now",
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
