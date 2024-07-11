import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/vehilce_provider.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/models/vehicle/vehicle_type.dart';

class VehicleSubTypesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        double containerHeight =  80.0;
        double imageSize = 60.0 ;
        double fontSize =  12.0 ;

    return Consumer<VehicleProvider>(
      builder: (context, vehicleProvider, child) {
        return AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Vehicle Type'),
              const SizedBox(height: 10),
              SizedBox(
                height: containerHeight,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vehicleProvider.subVehicleTypes.length,
                  itemBuilder: (context, index) {
                    VehicleTypeModel subtype =
                        vehicleProvider.subVehicleTypes[index];
                    return GestureDetector(
                      onTap: () {
                        vehicleProvider.setSelectedVehicleSubtype(subtype);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        border: Border.all(
                          color: vehicleProvider.selectedVehicleSubtype == 
                                    subtype
                              ? AppColors.primaryColor
                              : Colors.white,
                          width: vehicleProvider.selectedVehicleSubtype ==
                                    subtype?1:0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              subtype.image,
                              width: imageSize,
                            ),
                            const SizedBox(height: 10),
                            Text(subtype.name, style: TextStyle(fontSize: fontSize),),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          crossFadeState: vehicleProvider.subVehicleTypes.isNotEmpty
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }
}
