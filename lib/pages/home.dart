import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_buildHomeHeader()],
        ),
      ),
    );
  }

  Widget _buildHomeHeader() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello, Gojo Satoru',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E2E2E),
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Let`s start learning! 📚',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2E2E2E),
                ),
              ),
            ],
          ),
          CircleAvatar(
            radius: 25, // kamu bisa atur ukuran bulatan
            backgroundImage: AssetImage('assets/avatar_logo.jpg'),
          ),
        ],
      ),
    );
  }
}
