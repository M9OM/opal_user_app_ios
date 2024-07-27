import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:opal_user_app/config/url.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/utils/helper/helper.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/auth/login/login_screen.dart';
import 'package:opal_user_app/views/widgets/custom_input_field.dart';

class RegistrationPage extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.red.shade700, Colors.red.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1800),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeInUp(
                            duration: const Duration(milliseconds: 2100),
                            child: Image.asset(
                              'assets/icon/opal.png',
                              width: 150,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.grey),
                              ),
                                                        GestureDetector(
                            onTap: () {
                              NavHelpers.navigateAndReplace(context, LoginPage());
                            },

                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomInputField(
                            hint: 'Full Name',
                            controller: _fullNameController,
                            keyboardType: TextInputType.name,
                          ),
                          CustomInputField(
                            hint: 'Your e-mail',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          CustomInputField(
                            hint: 'Password',
                            controller: _passwordController,
                            obscureText: true,
                          ),
                        Align(
  alignment: Alignment.centerRight,
  child: RichText(
    text: TextSpan(
      text: 'By clicking Register, you agree to our ',
      style: const TextStyle(
        color: Colors.grey,
      ),
      children: [
        TextSpan(
          text: 'terms and conditions',
          style: const TextStyle(
            color: Colors.grey,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              MiscHelpers.launchUrl_(Uri.parse(URLOpal.pravicy_po));
            },
        ),
        const TextSpan(
          text: '.',
        ),
      ],
    ),
  ),
),

                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              // Handle registration logic
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColors.primaryColor.withOpacity(0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Or sign up with',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Handle Google sign up logic
                                },
                                icon: Image.asset(
                                  'assets/icon/google.png',
                                  height: 24,
                                  width: 24,
                                ),
                                label: const Text('Google'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Handle Apple sign up logic
                                },
                                icon: const Icon(
                                  Icons.apple,
                                  color: Colors.grey,
                                  size: 30,
                                ),
                                label: const Text('Apple'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    side: const BorderSide(color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
