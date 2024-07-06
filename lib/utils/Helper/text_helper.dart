import 'package:intl/intl.dart';

class TextProcessing {
  static String formatCurrency(double amount) {
    final NumberFormat formatter = NumberFormat.currency(symbol: 'OMR');
    return formatter.format(amount);
  }

  // Function to check if a string is null or empty
  static bool isNullOrEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  // Function to capitalize the first letter of each word in a string
  static String capitalizeEachWord(String str) {
    return str.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1);
      }
      return word;
    }).join(' ');
  }

  // Function to truncate a string to a certain length and add ellipsis
  static String truncateWithEllipsis(String str, int length) {
    return (str.length <= length) ? str : '${str.substring(0, length)}...';
  }
  
}
