import 'package:flutter/material.dart';

class NavHelpers {
  static void navigateTo(BuildContext context, Widget destination) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void navigateAndReplace(BuildContext context, Widget destination) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void navigateAndRemoveUntil(BuildContext context, Widget destination) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destination),
      (Route<dynamic> route) => false,
    );
  }
}
