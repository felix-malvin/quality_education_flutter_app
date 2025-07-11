import 'package:flutter/material.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/pages/course_summary.dart';
import 'package:quality_education_app/data/enrolled_course_data.dart';

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
                                            widget.course.badges[0].badgeColor,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
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
                                            widget.course.badges[1].badgeColor,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(5),
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      "${widget.course.lessonSections.length} lessons",
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
                                _buildPageViewAboutSection(media),
                                _buildPageViewLessonSection(media),
                                _buildPageViewReviewSection(media),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF9F9F9),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 18,
                              color: Color(0xFF2E2E2E),
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF9F9F9),
                          ),
                          child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.share,
                              size: 18,
                              color: Color(0xFF2E2E2E),
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ),
                    ],
                  ),
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

  Widget _buildInfoSectionCard(String title, String info) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF585555),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            info,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF0066FF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
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
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Info',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        _buildInfoSectionCard(
                          'Students',
                          widget.course.totalStudents,
                        ),
                        _buildInfoSectionCard(
                          'Language',
                          widget.course.language,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        _buildInfoSectionCard(
                          'Duration',
                          widget.course.duration,
                        ),
                        _buildInfoSectionCard('Level', widget.course.language),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        _buildInfoSectionCard(
                          'Certificate',
                          widget.course.isCertificate ? 'Yes' : 'No',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewLessonSection(media) {
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
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2E2E2E),
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Mukta',
                        ),
                        children: [
                          TextSpan(text: 'Lessons '),
                          TextSpan(
                            text: '(${widget.course.lessonSections.length})',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF0066FF),
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Mukta',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...widget.course.lessonSections.map((section) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Section - ${section.sectionTitle}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF585555),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                section.duration,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF0066FF),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ...section.lessons.asMap().entries.map((entry) {
                            int localIndex = entry.key;
                            String lessonTitle = entry.value;
                            int globalLessonNumber = lessonCounter++;
                            String lessonNumberFormatted = globalLessonNumber
                                .toString()
                                .padLeft(2, '0');

                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF9F9F9),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                  horizontal: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0x89D9ECFB),
                                          ),
                                          child: Center(
                                            child: Text(
                                              lessonNumberFormatted,
                                              style: const TextStyle(
                                                color: Color(0xFF0066FF),
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          lessonTitle,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF585555),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Icon(
                                      Icons.play_circle,
                                      size: 30,
                                      color: Color(0xFF0066FF),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          SizedBox(height: 20),
                        ],
                      );
                    }).toList(),

                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageViewReviewSection(media) {
    final List<Map<String, dynamic>> reviews = [
      {
        "avatar": "assets/avatar_logo.jpg",
        "name": "Dewi Lestari",
        "rating": 4.5,
        "comment": "Materi sangat jelas dan mudah dipahami. Mantap banget!",
      },
      {
        "avatar": "assets/avatar_logo.jpg",
        "name": "Andi Nugroho",
        "rating": 5.0,
        "comment":
            "Pengajar sangat interaktif. Saya jadi semangat belajar lagi!",
      },
      {
        "avatar": "assets/avatar_logo.jpg",
        "name": "Sari Putri",
        "rating": 4.0,
        "comment":
            "Cukup membantu, tapi ada bagian yang agak cepat penjelasannya.",
      },
      {
        "avatar": "assets/avatar_logo.jpg",
        "name": "Budi Santoso",
        "rating": 3.5,
        "comment": "Lumayan bagus, tapi perlu ditambah contoh kasus nyata.",
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Container(
          width: media.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Search
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF2E2E2E),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Mukta',
                      ),
                      children: [
                        TextSpan(text: 'Reviews '),
                        TextSpan(
                          text: '(${widget.course.totalRatings})',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF0066FF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 43,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search here",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xFF0066FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFF0F1F5),
                              contentPadding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 43,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            backgroundColor: Color(0xFF0066FF),
                            foregroundColor: Color(0xFFF9F9F9),
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Icon(Icons.filter_list, size: 24),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),

              Column(
                children:
                    reviews.map((review) {
                      return _buildReviewCard(
                        avatar: review['avatar'],
                        name: review['name'],
                        rating: review['rating'],
                        comment: review['comment'],
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard({
    required String avatar,
    required String name,
    required double rating,
    required String comment,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE6E6E6), width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(avatar), radius: 24),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating.round()
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              comment,
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(media, func) {
    bool isAlreadyEnrolled(Course course, enrolledCourses) {
      return enrolledCourses.any((e) => e.enrolledCourse.id == course.id);
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
                      if (isAlreadyEnrolled(widget.course, enrolledCourses)) {
                        showAlreadyEnrolledSnackbar(context);
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    CourseSummaryPage(course: widget.course),
                          ),
                        );
                      }
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

  void showAlreadyEnrolledSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xFF0066FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "You have already enrolled in this course.",
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
