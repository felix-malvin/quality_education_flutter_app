import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle FormTitle() {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Color(0xFF0066FF),
    );
  }

  static TextStyle FormDescription() {
    return TextStyle(
      fontSize: 15,
      color: Color(0xFF2E2E2E),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle HomeSubtitle() {
    return TextStyle(
      fontSize: 20,
      color: Color(0xFF2E2E2E),
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle SecondaryText() {
    return TextStyle(
      fontSize: 15,
      color: Color(0xFFFFC524),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle SubjectName(){
    return TextStyle(
      fontSize: 15,
      color: Color(0xFF2E2E2E),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle CourseName(){
    return TextStyle(
      fontSize: 16,
      color: Color(0xFF2E2E2E),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle CourseDuration(){
    return TextStyle(
      fontSize: 12,
      color: Color(0xFF0066FF),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle CourseLessons(){
    return TextStyle(
      fontSize: 12,
      color: Color(0xFF0066FF),
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle Badge(badge_name_color){
    return TextStyle(
      fontSize: 11,
      color: badge_name_color,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle CoursePrice(){
    return TextStyle(
      fontSize: 15,
      color: Color(0xFF2E2E2E),
      fontWeight: FontWeight.w700,
    );
  }
}
