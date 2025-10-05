import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/pages/signin.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPage createState() => _SignupPage();
}

class _SignupPage extends State<SignupPage> {
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final FocusNode _focusConfirmPassword = FocusNode();

  Color _emailFillColor = Color(0xFFF0F1F5);
  Color _passwordFillColor = Color(0xFFF0F1F5);
  Color _confirmPasswordFillColor = Color(0xFFF0F1F5);

  @override
  void initState() {
    super.initState();

    _focusEmail.addListener(() {
      setState(() {
        _emailFillColor =
            _focusEmail.hasFocus ? Color(0x1A0066FF) : Color(0xFFF0F1F5);
      });
    });

    _focusPassword.addListener(() {
      setState(() {
        _passwordFillColor =
            _focusPassword.hasFocus ? Color(0x1A0066FF) : Color(0xFFF0F1F5);
      });
    });

    _focusConfirmPassword.addListener(() {
      setState(() {
        _confirmPasswordFillColor =
            _focusConfirmPassword.hasFocus
                ? Color(0x1A0066FF)
                : Color(0xFFF0F1F5);
      });
    });
  }

  @override
  void dispose() {
    _focusEmail.dispose();
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf9f9f9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Create Account', style: AppWidget.FormTitle()),
            Text(
              'Join us today! Explore endless opportunities.',
              style: AppWidget.FormDescription(),
            ),
            SizedBox(height: 40),
            _buildInputField(
              'Email',
              'Enter your email',
              _focusEmail,
              _emailFillColor,
            ),
            SizedBox(height: 15),
            _buildInputField(
              'Password',
              'Enter your password',
              _focusPassword,
              _passwordFillColor,
              obscureText: true,
            ),
            SizedBox(height: 15),
            _buildInputField(
              'Confirm Password',
              'Confirm your password',
              _focusConfirmPassword,
              _confirmPasswordFillColor,
              obscureText: true,
            ),
            SizedBox(height: 50),
            _buildPrimaryButton(),
            SizedBox(height: 10),
            _buildSecondaryButton(),
            SizedBox(height: 30),
            _buildDivider('or register with'),
            SizedBox(height: 30),
            Row(
              children: [
                _buildIconButton('facebook_logo', 'Facebook'),
                SizedBox(width: 16),
                _buildIconButton('google_logo', 'Google'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
    String label,
    String placeholder,
    FocusNode focusNode,
    Color fillColor, {
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        SizedBox(height: 5),
        _buildInputBox(placeholder, focusNode, fillColor),
      ],
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF2E2E2E),
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildInputBox(
    String placeholder,
    FocusNode focusNode,
    Color fillColor, {
    bool obscureText = false,
  }) {
    return TextField(
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0066FF), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildPrimaryButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SigninPage()),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF0066FF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFFF9F9F9),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildSecondaryButton() {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SigninPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF0F1F5),
          foregroundColor: Color(0xFF0066FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Text(
          "Already have an account",
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF0066FF),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildDivider(String text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFF585555), // Warna garis
            thickness: 0.5, // Ketebalan garis
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w300,
              color: Color(0xFF585555),
            ),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFF585555), thickness: 0.5)),
      ],
    );
  }

  Widget _buildIconButton(String logo, String text) {
    return Expanded(
      flex: 1,
      child: TextButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Color(0xFF0066FF), width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/$logo.png', width: 25),
            SizedBox(width: 6),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF0066FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
