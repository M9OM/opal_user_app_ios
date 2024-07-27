import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  late XFile _profilePicture;

  Future<void> _pickProfilePicture() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePicture = pickedFile;
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile changes
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/admin.jpeg'),

                        // ignore: unnecessary_null_comparison
                        // backgroundImage: _profilePicture != null
                        //     ? FileImage(File(_profilePicture.path))
                        //     : const AssetImage('assets/default_profile_picture.png'),
                        // child: _profilePicture == null
                        //     ? Icon(Icons.add_a_photo, size: 50, color: Colors.white)
                        //     : null,
                      ),
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.backgroundColor, width: 3),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: const Icon(Icons.edit)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomButton(text: 'Save', onPressed: _saveProfile)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
