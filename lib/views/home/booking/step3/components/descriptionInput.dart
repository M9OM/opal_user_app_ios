import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return TextField(
          decoration: InputDecoration(
            hintText: 'Description / Special Handling',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (value) {
            orderProvider.setDescription(value);
          },
        );
      },
    );
  }
}
