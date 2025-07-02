import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar2.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:intl/intl.dart';
import 'dart:collection';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<Map<String, dynamic>> rawNotifications = [
    {
      'avatar': Icons.school,
      'title': 'New Course Available!',
      'content': 'Check out the latest course tailored for you.',
      'date': '2025-06-27 14:30:00',
      'isRead': false,
    },
    {
      'avatar': Icons.star,
      'title': 'Rate Your Course',
      'content': 'Help us improve by rating your course.',
      'date': '2025-06-27 10:15:00',
      'isRead': false,
    },
    {
      'avatar': Icons.notifications,
      'title': 'System Update',
      'content': 'The app has been updated to the latest version.',
      'date': '2025-06-26 09:45:00',
      'isRead': false,
    },
    {
      'avatar': Icons.local_offer,
      'title': 'Special Discount!',
      'content': 'Get 20% off on selected courses this week.',
      'date': '2025-06-26 16:30:00',
      'isRead': false,
    },
    {
      'avatar': Icons.lock,
      'title': 'Password Changed',
      'content': 'Your password was changed successfully.',
      'date': '2025-06-25 08:20:00',
      'isRead': false,
    },
    {
      'avatar': Icons.emoji_events,
      'title': 'You Earned a Badge!',
      'content': 'Congrats! You earned the "Fast Learner" badge.',
      'date': '2025-06-25 14:05:00',
      'isRead': false,
    },
  ];

  LinkedHashMap<String, List<Map<String, dynamic>>> groupByDate(
    List<Map<String, dynamic>> list,
  ) {
    final map = LinkedHashMap<String, List<Map<String, dynamic>>>();
    for (var item in list) {
      final date = DateTime.parse(item['date']);
      final formattedDate = DateFormat('MMMM d, yyyy').format(date);
      map.putIfAbsent(formattedDate, () => []).add(item);
    }
    return map;
  }

  String formatTime(String dateStr) {
    final date = DateTime.parse(dateStr);
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Inbox '),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Text('Inbox Page'),
      ),
    );
  }
}