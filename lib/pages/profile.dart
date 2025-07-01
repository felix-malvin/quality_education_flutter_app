import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Profile'),
      body: Center(
        child: Column(
          children: [
            _buildProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildAccountSection(),
                    _buildSectionDivider(media),
                    _buildHelpSection(),
                    _buildSectionDivider(media),
                    _buildAboutSection(),
                    _buildBottomSection(media),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileItem(IconData icon, String name, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 35, right: 35),
      leading: Icon(icon, color: CustomColors.secondaryText),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: CustomColors.secondaryText,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: CustomColors.secondaryText,
        size: 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildSectionDivider(media) {
    return Divider(
      thickness: 7,
      color: Color(0xFFF0F1F5),
    );
  }

  Widget _buildListTileDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Divider(height: 0.2, color: Colors.black.withOpacity(0.1)),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/avatar_logo.jpg'),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileData['name'],
                    style: TextStyle(
                      color: CustomColors.primaryText,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    '@${profileData["username"]}',
                    style: TextStyle(
                      color: CustomColors.secondaryText,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      backgroundColor: CustomColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildAccountSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Account',
              style: TextStyle(
                color: CustomColors.primaryText,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 2),
          _buildListTileItem(Icons.payment, 'Payment Method', () {}),
          _buildListTileDivider(),
          _buildListTileItem(Icons.history, 'Activity', () {
            Navigator.of(context)
                .push(
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 1000),
                    pageBuilder:
                        (context, animation, secondaryAnimation) =>
                            ActivityPage(),
                    transitionsBuilder: (
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    ) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      final tween = Tween(
                        begin: begin,
                        end: end,
                      ).chain(CurveTween(curve: Curves.ease));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  ),
                )
                .then((hasUpdated) {
                  if (hasUpdated == true) {
                    setState(() {});
                  }
                });
          }),
          _buildListTileDivider(),
          _buildListTileItem(Icons.language, 'Language', () {}),
        ],
      ),
    );
  }

  Widget _buildHelpSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'Help',
              style: TextStyle(
                color: CustomColors.primaryText,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 2),
          _buildListTileItem(Icons.contact_support, 'Help Center', () {}),
          _buildListTileDivider(),
          _buildListTileItem(Icons.bubble_chart, 'Your Report', () {}),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              'About',
              style: TextStyle(
                color: CustomColors.primaryText,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 2),
          _buildListTileItem(Icons.emoji_objects, 'Edvance Guide', () {}),
          _buildListTileDivider(),
          _buildListTileItem(Icons.content_paste, 'Terms and Conditions', () {}),
          _buildListTileDivider(),
          _buildListTileItem(Icons.policy, 'Privacy Policy', () {}),
        ],
      ),
    );
  }

  Widget _buildBottomSection(media) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: media.width,
      decoration: BoxDecoration(color: Color(0xFFF0F1F5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: CustomColors.primaryText,
              fontWeight: FontWeight.w300,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: CustomColors.primary,
                foregroundColor: CustomColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              ),
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFFF9F9F9),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
