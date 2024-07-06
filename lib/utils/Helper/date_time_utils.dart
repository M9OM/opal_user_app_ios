import 'package:intl/intl.dart';

class DateFormatterHelper {
  // Function to format date
  static String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  }

  // Function to parse date from string
  static DateTime parseDate(String dateStr) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.parse(dateStr);
  }

  // Function to format date in a more readable format
  static String formatReadableDate(DateTime date) {
    final DateFormat formatter = DateFormat('MMM d, yyyy');
    return formatter.format(date);
  }
}