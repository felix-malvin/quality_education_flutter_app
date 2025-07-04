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

  Future<void> _pickDate() async {}

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
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/avatar_logo.jpg',
                            ),
                          ),
                          SizedBox(height: 8),
                          TextButton(
                            onPressed: () {},
                            child: Text("Change Profile"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Nama
                    _buildInputField(
                      'Name',
                      'Enter your name',
                      _nameController,
                      _nameFocus,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Nama tidak boleh kosong'
                                  : null,
                      inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    ),
                    SizedBox(height: 10),

                    // Username
                    _buildInputField(
                      'Username',
                      'Enter your username',
                      _usernameController,
                      _usernameFocus,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Username tidak boleh kosong'
                                  : null,
                      inputFormatters: [LengthLimitingTextInputFormatter(12)],
                    ),
                    SizedBox(height: 10),

                    // No Telepon
                    _buildInputField(
                      'Telephone',
                      'Enter your telephone',
                      _phoneController,
                      _phoneFocus,
                      validator:
                          (value) =>
                              value == null || value.isEmpty
                                  ? 'Nomor telepon tidak boleh kosong'
                                  : null,
                    ),
                    SizedBox(height: 10),

                    // Email
                    _buildInputField(
                      'Email',
                      'Enter your email',
                      _emailController,
                      _emailFocus,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email tidak boleh kosong';
                        final emailRegex = RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$',
                        );
                        return !emailRegex.hasMatch(value)
                            ? 'Email tidak valid'
                            : null;
                      },
                    ),
                    SizedBox(height: 10),

                    // Jenis Kelamin
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Gender'),
                        SizedBox(height: 5),
                        _buildGenderDropdown(_gender, (val) {
                          setState(() => _gender = val);
                        }),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Tanggal Lahir
                    _buildDatePickerField('Birth date', _birthDate, _pickDate),
                    SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomSection(media),
        ],
      ),
    );
  }
}
