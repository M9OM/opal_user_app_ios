import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/bid/add_bid_screen.dart';
import 'package:opal_user_app/views/screens/home/booking/confirm.dart';
import 'package:opal_user_app/views/screens/home/booking/step1/components/VehicleSubTypesList.dart';
import 'package:opal_user_app/views/screens/home/booking/step1/components/VehicleTypesList.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class SetVehicle extends StatefulWidget {
  @override
  _SetVehicleState createState() => _SetVehicleState();
}

class _SetVehicleState extends State<SetVehicle> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<GoogleMapProvider, PageViewProvider>(
      builder:
          (context,googleMapProvider, pageProvider, child) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    VehicleTypesList(),
                    const SizedBox(height: 10),
                    VehicleSubTypesList(),
                  ],
                ),
              ),
            ),
            buildConfirmButton(
              showButton: googleMapProvider.fromPosition != null &&
                  googleMapProvider.toPosition != null,
              googleMapProvider: googleMapProvider,
              pageProvider: pageProvider,
              hint: "Confirm drop-off",
              onPressed: () {
                googleMapProvider.getDirections();
                setState(() {
                  googleMapProvider.confirmDropPickOff(true); // Stop selection

                  googleMapProvider.updateFrom(false); // Stop selection
                });

                    NavHelpers.navigateAndRemoveUntil(context,  StepFormPage());
              },
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
