import 'package:flutter/material.dart';
import 'package:quality_education_app/pages/home.dart';
import 'package:quality_education_app/pages/my_courses.dart';
import 'package:quality_education_app/pages/discover.dart';
import 'package:quality_education_app/pages/inbox.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    MyCoursePage(),
    DiscoverPage(),
    InboxPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Icon _getIcon(int index, IconData filled, IconData outlined) {
    return Icon(_selectedIndex == index ? filled : outlined);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: const BoxDecoration(
          color: Color(0xFFF9F9F9),
          border: Border(top: BorderSide(color: Color(0xFFE6E6E6), width: 1)),
        ),

        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF0066FF),
          unselectedItemColor: const Color(0xFF585555),
          backgroundColor: Color(0xFFF9F9F9),
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: Tooltip(
                message: 'Home',
                preferBelow: false,
                child: _getIcon(0, Icons.home, Icons.home_outlined),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                message: 'My Course',
                preferBelow: false,
                child: _getIcon(1, Icons.book, Icons.book_outlined),
              ),
              label: 'My Course',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                message: 'Discover',
                preferBelow: false,
                child: _getIcon(
                  2,
                  Icons.browse_gallery,
                  Icons.browse_gallery_outlined,
                ),
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Tooltip(
                message: 'Inbox',
                preferBelow: false,
                child: _getIcon(3, Icons.chat, Icons.chat_outlined),
              ),
              label: 'Inbox',
            ),
          ],
        ),
      ),
    );
  }
}
