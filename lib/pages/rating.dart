import 'package:flutter/material.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/commons/color.dart';

class RatingPage extends StatefulWidget {
  final Course course;

  const RatingPage({Key? key, required this.course}) : super(key: key);

  @override
  _RatingPage createState() => _RatingPage();
}

class _RatingPage extends State<RatingPage>
    with SingleTickerProviderStateMixin {
  int _rating = 5;

  final List<String> _ratingTexts = [
    "",
    "Poor",
    "Fair",
    "Average",
    "Good",
    "Excellent",
  ];

  final List<String> _complaints = [
    "App is slow",
    "Bugs found",
    "Difficult to use",
    "Design issue",
  ];

  final Map<String, bool> _selectedComplaints = {};

  @override
  void initState() {
    super.initState();
    _complaints.forEach((item) {
      _selectedComplaints[item] = false;
    });
  }

  void _handleRatingTap(int index) {
    setState(() {
      _rating = index;
      // Reset all checkboxes when rating changes
      _complaints.forEach((item) {
        _selectedComplaints[item] = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool showComplaints = _rating >= 1 && _rating <= 4;
    bool showPraise = _rating == 5;

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

                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(height: 2, color: Color(0xFFE6E6E6)),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: SingleChildScrollView(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Text(
                                      'Your overall rating for this course',
                                      style: TextStyle(
                                        color: Color(0xFF585555),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: Text(
                                            _ratingTexts[_rating],
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(5, (index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 2,
                                                  ),
                                              child: GestureDetector(
                                                onTap:
                                                    () => _handleRatingTap(
                                                      index + 1,
                                                    ),
                                                child: Icon(
                                                  Icons.star,
                                                  color:
                                                      index < _rating
                                                          ? Colors.amber
                                                          : Colors.grey,
                                                  size: 32,
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    // Show complaints for 1-4 stars
                                    if (showComplaints) ...[
                                      Text(
                                        "What are your complaints?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      ..._complaints.map((item) {
                                        return CheckboxListTile(
                                          title: Text(item),
                                          value: _selectedComplaints[item],
                                          activeColor: Color(0xFF0066FF),
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedComplaints[item] =
                                                  value ?? false;
                                            });
                                          },
                                        );
                                      }).toList(),
                                      SizedBox(height: 10),
                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: "Additional Suggestions",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          floatingLabelStyle: TextStyle(
                                            color: Color(0xFF0066FF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0066FF),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 14,
                                            horizontal: 16,
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Color(0xFF2E2E2E),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        maxLines: 6,
                                      ),
                                    ],

                                    if (showPraise) ...[
                                      TextField(
                                        decoration: InputDecoration(
                                          labelText: "Write your praise",
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(width: 1),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          floatingLabelStyle: TextStyle(
                                            color: Color(0xFF0066FF),
                                            fontWeight: FontWeight.w600,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF0066FF),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 14,
                                            horizontal: 16,
                                          ),
                                        ),
                                        style: TextStyle(
                                          color: Color(0xFF2E2E2E),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                        maxLines: 6,
                                      ),
                                    ],
                                    SizedBox(height: 50),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
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
                            onPressed: () {},
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
          _buildBottomSection(media),
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
                onPressed: () {
                },
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  foregroundColor: CustomColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  "Rate this course",
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
