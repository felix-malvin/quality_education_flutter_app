import 'package:flutter/material.dart';
import 'package:quality_education_app/widgets/appbar/custom_appbar.dart';
import 'package:quality_education_app/commons/color.dart';
import 'package:quality_education_app/data/profile_data.dart';
import 'package:flutter/services.dart';

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
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: _birthDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      setState(() => _birthDate = date);
    }
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
  void initState() {
    super.initState();

    _nameController.text = profileData['name'] ?? '';
    _usernameController.text = profileData['username'] ?? '';
    _phoneController.text = profileData['phone'] ?? '';
    _emailController.text = profileData['email'] ?? '';
    _gender = profileData['gender'];
    _birthDate = DateTime.tryParse(profileData['birthDate'] ?? '');
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

  Widget _buildInputField(
    String label,
    String placeholder,
    TextEditingController controller,
    FocusNode focusNode, {
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        SizedBox(height: 5),
        _buildInputBox(
          placeholder,
          controller,
          focusNode,
          validator: validator,
          inputFormatters: inputFormatters,
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
    TextEditingController controller,
    FocusNode focusNode, {
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        filled: true,
        fillColor: Color(0xFFF0F1F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0066FF), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      inputFormatters: inputFormatters,
    );
  }

  Widget _buildGenderDropdown(
    String? selectedGender,
    void Function(String?) onChanged,
  ) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      items:
          [
            'Male',
            'Female',
          ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      validator:
          (value) =>
              value == null || value.isEmpty ? 'Pilih jenis kelamin' : null,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF0F1F5),
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

  Widget _buildBottomSection(media) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        width: media.width,
        height: 0.12 * media.height,
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, -6), // Shadow ke atas
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveChanges,
                style: TextButton.styleFrom(
                  backgroundColor: CustomColors.primary,
                  foregroundColor: CustomColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                ),
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF9F9F9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void showSaveChangesSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Color(0xFF0066FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "Changes have been saved",
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
