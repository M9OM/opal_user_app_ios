import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Make sure to add the intl package in pubspec.yaml

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? selectedDate;

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: GestureDetector(
        onTap: () => _selectDateTime(context),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            border: Border.all(color: Colors.white, width: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDate != null
                    ? DateFormat('yyyy-MM-dd HH:mm').format(selectedDate!)
                    : 'Select Date & Time',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              const Icon(Icons.calendar_today),
            ],
          ),
        ),
      ),
    );
  }
}
