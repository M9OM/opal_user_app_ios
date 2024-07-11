import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class TripTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return Row(
          children: [
            Text('Round Trip'),
            
            Flexible(
              child: CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                value: orderProvider.tripType == TripType.roundTrip,
                onChanged: (bool? value) {
                  if (value != null) {
                    orderProvider.setTripType(
                      value ? TripType.roundTrip : TripType.oneWay,
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
