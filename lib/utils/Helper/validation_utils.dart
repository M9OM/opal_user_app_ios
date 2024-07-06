
class ValidatorsHelper {
  // Function to validate email
  static bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  // Function to validate password
  static bool isValidPassword(String password) {
    // Example validation: Password should be at least 8 characters long
    return password.length >= 8;
  }

  // Function to validate if a string is a valid phone number
  static bool isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^\+?[0-9]{10,13}$');
    return regex.hasMatch(phoneNumber);
  }
}