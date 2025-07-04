import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/profile_data.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String? _gender;
  DateTime? _birthDate;

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _nameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();

  Future<void> _pickDate() async {

  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    _nameFocus.dispose();
    _usernameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();

    super.dispose();
  }

  void _saveChanges() {
  if (_formKey.currentState!.validate()) {
    profileData['name'] = _nameController.text;
    profileData['username'] = _usernameController.text;
    profileData['phone'] = _phoneController.text;
    profileData['email'] = _emailController.text;
    profileData['gender'] = _gender;
    profileData['birthDate'] = _birthDate?.toIso8601String();

    showSaveChangesSnackbar(context);

    // Pop keluar dan beri sinyal ke halaman sebelumnya agar refresh
    Navigator.pop(context, true);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Edit Profile"),
      backgroundColor: CustomColors.white,
      body: Center(
        child: Text("Edit Profile Page"),
      ),
    );
  }
}
