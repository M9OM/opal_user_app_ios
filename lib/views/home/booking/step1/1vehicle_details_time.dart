import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/views/home/booking/confirm.dart';
import 'package:opal_user_app/views/home/booking/step1/components/DateSelector.dart';
import 'package:opal_user_app/views/home/booking/step1/components/LoadCounter.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleTonsDropdown.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleTypesList.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class VehicleDetailsStep extends StatefulWidget {
  @override
  _VehicleDetailsStepState createState() => _VehicleDetailsStepState();
}

class _VehicleDetailsStepState extends State<VehicleDetailsStep> {
  bool showButton = false; // Flag to control button animation

  @override
  void initState() {
    super.initState();
    // Simulate delay to show button with animation
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showButton = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<OrderDetailsProvider, GoogleMapProvider, PageViewProvider>(
      builder:
          (context, orderProvider, googleMapProvider, pageProvider, child) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Kind of Vehicle'),
                      const SizedBox(height: 10),
                      VehicleTypesList(),
                      const SizedBox(height: 20),
                      VehicleTonsDropdown(),
                      const SizedBox(height: 10),
                      const Text('Loads'),
                      const SizedBox(height: 10),
                      const LoadCounter(),
                      const SizedBox(height: 20),
                      DateSelector(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            buildConfirmButton(
                showButton: showButton,
                orderProvider: orderProvider,
                googleMapProvider: googleMapProvider,
                pageProvider: pageProvider,
                hint: "تاكيد موقع التحميل",
                onPressed: () {
                  orderProvider.setLatLngStartPoint(
                    googleMapProvider.currentPosition,
                  );
                  pageProvider.nextPage();
                }),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
