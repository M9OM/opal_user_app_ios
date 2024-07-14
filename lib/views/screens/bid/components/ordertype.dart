import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class OrderTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    return GestureDetector(
      onTap: () {
        orderProvider.setSelectedOrderType(type);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.2)
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: isSelected ? AppColors.primaryColor : Colors.black,
          ),
        ),
      ),
    );
  }
}
