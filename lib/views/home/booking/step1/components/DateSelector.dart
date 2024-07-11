import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:intl/intl.dart'; // Make sure to add the intl package in pubspec.yaml

class DateSelector extends StatelessWidget {
  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: Provider.of<OrderDetailsProvider>(context, listen: false).selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(
          Provider.of<OrderDetailsProvider>(context, listen: false).selectedDate ?? DateTime.now(),
        ),
      );

      if (pickedTime != null) {
        final DateTime selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        Provider.of<OrderDetailsProvider>(context, listen: false).setSelectedDate(selectedDateTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
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
                    orderProvider.selectedDate != null
                        ? DateFormat('yyyy-MM-dd HH:mm').format(orderProvider.selectedDate!)
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
      },
    );
  }
}
