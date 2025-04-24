import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String title;
  final String image;
  final Color baseColor;
  final Color quarterColor;

  const SubjectCard({
    super.key,
    required this.title,
    required this.image,
    required this.baseColor,
    required this.quarterColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: baseColor,
          ),
          child: Stack(
            children: [
              // Quarter circle with icon
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 60,
                  height: 78,
                  decoration: BoxDecoration(
                    color: quarterColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(65),
                    ),
                  ),
                  child: Align(
                    alignment: const Alignment(0, -0.5), 
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward),
                      color: const Color(0xFFF9F9F9),
                      iconSize: 25,
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(image, width: 48),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xFFF9F9F9),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
