import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/home/booking/confirm.dart';
import 'package:opal_user_app/views/home/booking/step1/components/DateSelector.dart';
import 'package:opal_user_app/views/home/booking/step1/components/LoadCounter.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleSubTypesList.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleTypesList.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class Step1Page extends StatefulWidget {
  @override
  _Step1PageState createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
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
                      const Text('Vehicle Main Type'),
                      const SizedBox(height: 10),
                      VehicleTypesList(),
                      const SizedBox(height: 10),
                      VehicleSubTypesList(),
                      // const Text('Loads'),
                      // const SizedBox(height: 10),
                      // const LoadCounter(),
                      // const SizedBox(height: 20),
                      // DateSelector(),
                      // const SizedBox(height: 20),
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
                hint: "Pickup Location",
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