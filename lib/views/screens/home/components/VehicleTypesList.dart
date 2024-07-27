import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/vehilce_provider.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class VehicleTypesList extends StatefulWidget {
  @override
  _VehicleTypesListState createState() => _VehicleTypesListState();
}

class _VehicleTypesListState extends State<VehicleTypesList> {
  @override
  void initState() {
    super.initState();
    Provider.of<VehicleProvider>(context, listen: false).loadAndSetVehicleTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VehicleProvider>(
      builder: (context, vehicleProvider, child) {
        // Determine the sizes based on whether a vehicle type is selected
        bool isSelected = vehicleProvider.selectedVehicleType.isNotEmpty;
        double containerHeight = isSelected ? 80.0 : 120.0;
        double imageSize = isSelected ? 60.0 : 80.0;
        double fontSize = isSelected ? 12.0 : 13.0;

        return Column(
          children: [
            
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: containerHeight,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vehicleProvider.mainVehicleTypes.length,
                itemBuilder: (context, index) {
                  final vehicleType = vehicleProvider.mainVehicleTypes[index];
                  return GestureDetector(
                    onTap: () {
                      vehicleProvider.setSelectedVehicleType(vehicleType);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        border: Border.all(
                          color: vehicleProvider.selectedVehicleType == vehicleType.name
                              ? AppColors.primaryColor
                              : Colors.white,
                          width: vehicleProvider.selectedVehicleType == vehicleType.name?1:0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            vehicleType.image,
                            width: vehicleProvider.selectedVehicleType == vehicleType.name?imageSize+10:imageSize,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            vehicleType.name,
                            style: TextStyle(fontSize: fontSize),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
