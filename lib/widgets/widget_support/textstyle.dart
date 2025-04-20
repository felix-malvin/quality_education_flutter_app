import 'package:flutter/material.dart';
import 'package:quality_education_app/commons/color.dart';

class AppWidget {
  static TextStyle FormTitle() {
    return TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: CustomColors.primary,
    );
  }

  static TextStyle FormDescription() {
    return TextStyle(
      fontSize: 15,
      color: CustomColors.primaryText,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle HomeSubtitle() {
    return TextStyle(
      fontSize: 20,
      color: CustomColors.primaryText,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle SecondaryText() {
    return TextStyle(
      fontSize: 15,
      color: CustomColors.secondary,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle SubjectName(){
    return TextStyle(
      fontSize: 15,
      color: CustomColors.primaryText,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle CourseName(){
    return TextStyle(
      fontSize: 16,
      color: CustomColors.primaryText,
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle CourseDuration(){
    return TextStyle(
      fontSize: 12,
      color: CustomColors.primary,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle CourseLessons(){
    return TextStyle(
      fontSize: 12,
      color: CustomColors.primary,
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
      color: CustomColors.primaryText,
      fontWeight: FontWeight.w700,
    );
  }
}
