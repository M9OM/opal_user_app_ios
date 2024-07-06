import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:opal_user_app/utils/app_colors.dart';

class VehicleTypesList extends StatelessWidget {
  final List<Map<String, String>> vehicleTypes = [
    {'name': 'Car', 'image': 'assets/images/Camry_hev.jpg'},
    {'name': 'Van', 'image': 'assets/images/Corolla.jpg'},
    {'name': 'Truck', 'image': 'assets/images/Hiace.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailsProvider>(
      builder: (context, orderProvider, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: orderProvider.selectedVehicleType == 'Truck' ? 100.0 : 120.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: vehicleTypes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  orderProvider.setSelectedVehicleType(vehicleTypes[index]['name']!);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: orderProvider.selectedVehicleType == vehicleTypes[index]['name']
                          ? AppColors.primaryColor
                          : Colors.grey,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        vehicleTypes[index]['image']!,
                        width: orderProvider.selectedVehicleType == 'Truck' ? 80.0 : 100.0,
                      ),
                      const SizedBox(height: 10),
                      Text(vehicleTypes[index]['name']!),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}