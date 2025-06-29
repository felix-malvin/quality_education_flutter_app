import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/widget_support/textstyle.dart';
import 'package:quality_education_app/pages/signup.dart';
import 'package:quality_education_app/widgets/layouts/main_layout.dart';
import 'package:quality_education_app/commons/color.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  _SigninPage createState() => _SigninPage();
}

class _SigninPage extends State<SigninPage> {
  final FocusNode _focusUsername = FocusNode();
  final FocusNode _focusPassword = FocusNode();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isChecked = false;

  Color _usernameFillColor = Color(0xFFF0F1F5);
  Color _passwordFillColor = Color(0xFFF0F1F5);

  @override
  void initState() {
    super.initState();

    _focusUsername.addListener(() {
      setState(() {
        _usernameFillColor =
            _focusUsername.hasFocus ? Color(0x1A0066FF) : Color(0xFFF0F1F5);
      });
    });

    _focusPassword.addListener(() {
      setState(() {
        _passwordFillColor =
            _focusPassword.hasFocus ? Color(0x1A0066FF) : Color(0xFFF0F1F5);
      });
    });
  }

  @override
  void dispose() {
    _focusUsername.dispose();
    _focusPassword.dispose();
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
            Text('Sign In', style: AppWidget.FormTitle()),
            Text(
              'Log in to access your courses and start learning!',
              style: AppWidget.FormDescription(),
            ),
            SizedBox(height: 40),
            _buildInputField(
              'Username',
              'Enter your username',
              _focusUsername,
              _usernameFillColor,
              controller: _usernameController,
            ),
            SizedBox(height: 15),
            _buildInputField(
              'Password',
              'Enter your password',
              _focusPassword,
              _passwordFillColor,
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                      activeColor: Color(0xFF0066FF),
                      checkColor: CustomColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF0066FF),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            _buildPrimaryButton(),
            SizedBox(height: 10),
            _buildSecondaryButton(),
            SizedBox(height: 40),
            _buildDivider('or login with'),
            SizedBox(height: 40),
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
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        SizedBox(height: 5),
        _buildInputBox(
          placeholder,
          focusNode,
          fillColor,
          obscureText: obscureText,
          controller: controller,
        ),
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
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
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
          String username = _usernameController.text.trim();
          String password = _passwordController.text.trim();

          // Simulasi akun user
          const dummyUsername = '1';
          const dummyPassword = '1';

          if (username == dummyUsername && password == dummyPassword) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainLayout()),
            );
          } else {
            _showLoginError();
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(0xFF0066FF),
          foregroundColor: CustomColors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          "Login",
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
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF0F1F5),
          foregroundColor: Color(0xFF0066FF),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          "Create an account",
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
          padding: EdgeInsets.only(top: 14, bottom: 14),
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

  void _showLoginError() {
    showModalBottomSheet(
      context: context,
      backgroundColor: CustomColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 10),
              Text(
                'Login Failed',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.primaryText,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'The username or password you entered is incorrect. Please try again!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: CustomColors.primaryText),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: CustomColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                  child: Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFF9F9F9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
