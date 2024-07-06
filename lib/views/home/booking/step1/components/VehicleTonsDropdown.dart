import 'package:flutter/material.dart';
import 'package:opal_user_app/views/widgets/custom_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class VehicleTonsDropdown extends StatelessWidget {
  final List<String> vehicleTons = ['1 Ton', '2 Ton', '3 Ton'];

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CustomDropdown(
                value: orderProvider.selectedVehicleTon,
                hint: 'Ton of Vehicle',
                items: vehicleTons,
                onChanged: (String? newValue) {
                  orderProvider.setSelectedVehicleTon(newValue!);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
          crossFadeState: orderProvider.selectedVehicleType == 'Truck'
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }
}