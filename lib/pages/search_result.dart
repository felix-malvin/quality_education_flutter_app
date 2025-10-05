import 'package:flutter/material.dart';
import 'package:quality_education_app/models/course_model.dart';
import 'package:quality_education_app/data/course_data.dart';
import 'package:quality_education_app/pages/course_detail.dart';
import 'package:quality_education_app/widgets/components/course_card.dart';

class SearchResultPage extends StatelessWidget {
  final String query;
  const SearchResultPage({Key? key, required this.query}) : super(key: key);

  Future<List<Course>> searchCourses(String keyword) async {
    await Future.delayed(const Duration(seconds: 2));
    final allCourses = courses;
    return allCourses
        .where(
          (course) => course.name.toLowerCase().contains(keyword.toLowerCase()),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    _searchController.text = query;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE6E6E6)),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Color(0xFF2E2E2E),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: SizedBox(
                      height: 43,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: "Search course...",
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFF0066FF),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: const Color(0xFFF0F1F5),
                              contentPadding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: FutureBuilder<List<Course>>(
                future: searchCourses(query),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("An error occurred, please try again."),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("Course not found"));
                  } else {
                    final results = snapshot.data!;
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      itemCount: results.length,
                      itemBuilder: (context, index) {
                        final course = results[index];
                        return CourseCard(
                          course: course,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        CourseDetailPage(course: course),
                              ),
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
