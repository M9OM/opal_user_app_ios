import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class TripTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              MSHCheckbox(
                size: 25,
                value: orderProvider.tripType == TripType.roundTrip,
                onChanged: (bool value) {
                  orderProvider.setTripType(
                    value ? TripType.roundTrip : TripType.oneWay,
                  );
                },
                style: MSHCheckboxStyle.fillScaleColor,
                colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  checkedColor: AppColors.primaryColor,
                  uncheckedColor: Colors.grey,
                  disabledColor: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
