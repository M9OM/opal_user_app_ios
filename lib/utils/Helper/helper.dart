import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class MiscHelpers {
  // Function to show a snack bar
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Function to hide keyboard
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  // Function to generate a random string
  static String generateRandomString(int length) {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List.generate(length, (index) => chars[(chars.length * (DateTime.now().millisecondsSinceEpoch % chars.length)).toInt() % chars.length]).join();
  }
}



