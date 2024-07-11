import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class OrderTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                const Text('Order Type'),
        const SizedBox(height: 10),

        Consumer<OrderDetailsProvider>(
          builder: (context, orderProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOrderTypeButton(context, orderProvider, 'Fixed Price'),
                _buildOrderTypeButton(context, orderProvider, 'Bid'),
                _buildOrderTypeButton(context, orderProvider, 'Urgent'),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildOrderTypeButton(
      BuildContext context, OrderDetailsProvider orderProvider, String type) {
    bool isSelected = orderProvider.selectedOrderType == type;
    return ElevatedButton(
      onPressed: () {
        orderProvider.setSelectedOrderType(type);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected?null:Colors.white.withOpacity(0.1)
      ),
      child: Text(type),
    );
  }
}
