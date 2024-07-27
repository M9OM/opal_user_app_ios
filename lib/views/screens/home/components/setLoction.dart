import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/bid/add_bid_screen.dart';
import 'package:opal_user_app/views/screens/home/components/VehicleSubTypesList.dart';
import 'package:opal_user_app/views/screens/home/components/VehicleTypesList.dart';
import 'package:opal_user_app/views/screens/home/components/confirm.dart';
import 'package:provider/provider.dart';

class SetVehicle extends StatefulWidget {
  @override
  _SetVehicleState createState() => _SetVehicleState();
}

class _SetVehicleState extends State<SetVehicle> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<GoogleMapProvider, PageViewProvider>(
      builder: (context, googleMapProvider, pageProvider, child) {
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

                NavHelpers.navigateTo(context, StepFormPage());
              },
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
