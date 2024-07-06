import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class DateSelector extends StatelessWidget {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: Provider.of<OrderDetailsProvider>(context, listen: false).selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      Provider.of<OrderDetailsProvider>(context, listen: false).setSelectedDate(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return SizedBox(
          width: 200,
          child: GestureDetector(
            onTap: () => _selectDate(context),
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
                        ? "${orderProvider.selectedDate!.toLocal()}".split(' ')[0]
                        : 'Collect Date',
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