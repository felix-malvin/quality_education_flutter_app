import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar2.dart';
import 'package:quality_education_app/commons/color.dart';

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