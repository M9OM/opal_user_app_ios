import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final String hint;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  CustomDropdown({
    required this.value,
    required this.hint,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(
          hint,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 16,
          ),
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1.0,
            ),
          ),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.1),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }
}