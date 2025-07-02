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

  bool get isInboxEmpty => rawNotifications.isEmpty;

  bool get isAllRead =>
      rawNotifications.isNotEmpty &&
      rawNotifications.every((notif) => notif['isRead'] == true);

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

  void markAllAsRead() {
    setState(() {
      for (var notif in rawNotifications) {
        notif['isRead'] = true;
      }
    });
  }

  void deleteAll() {
    setState(() {
      rawNotifications.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = groupByDate(rawNotifications);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Inbox',
        actions: [
          Theme(
            data: Theme.of(context).copyWith(
              popupMenuTheme: PopupMenuThemeData(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: Colors.black87),
              onSelected: (value) {
                
              },
              itemBuilder:
                  (context) => [
                    
                  ],
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.white,
      body:
          groupedNotifications.isEmpty
              ? Center(
                child: Text('No inbox.', style: TextStyle(color: Colors.grey)),
              )
              : ListView.builder(
                itemCount: groupedNotifications.length,
                itemBuilder: (context, index) {
                  final date = groupedNotifications.keys.elementAt(index);
                  final notifs = groupedNotifications[date]!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.grey[200],
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 30,
                        ),
                        child: Text(
                          date,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      ...notifs.map((notif) {
                        final notifId = '${notif['title']}-${notif['date']}';
                        return Dismissible(
                          key: Key(notifId),
                          direction: DismissDirection.endToStart,
                          background: Container(),
                          secondaryBackground: Container(
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.delete, color: Colors.white),
                              ],
                            ),
                          ),
                          onDismissed: (_) {
                            setState(() {
                              rawNotifications.remove(notif);
                            });
                          },
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 5,
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Color(0x89D9ECFB),
                              child: Icon(
                                notif['avatar'],
                                color: CustomColors.primary,
                              ),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notif['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              notif['content'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (!notif['isRead'])
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFC524),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                SizedBox(width: 8),
                                Text(
                                  formatTime(notif['date']),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                          ),
                        );
                      }),
                      SizedBox(height: 18),
                    ],
                  );
                },
              ),
    );
  }
}
