import 'package:flutter/material.dart';

class Subject {
  final String title;
  final String image;
  final String imagePrimary;
  final Color baseColor;
  final Color quarterColor;
  final List quiz;

  Subject({
    required this.title,
    required this.image,
    required this.imagePrimary,
    required this.baseColor,
    required this.quarterColor,
    required this.quiz,
  });
}