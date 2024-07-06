import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/views/home/booking/confirm.dart';
import 'package:opal_user_app/views/home/booking/step1/components/DateSelector.dart';
import 'package:opal_user_app/views/home/booking/step1/components/LoadCounter.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleTonsDropdown.dart';
import 'package:opal_user_app/views/home/booking/step1/components/VehicleTypesList.dart';
import 'package:opal_user_app/views/home/booking/step2/components/durationSelector.dart';
import 'package:opal_user_app/views/home/booking/step2/components/opalStandardsSwitch.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';

class LoadesStanderDurationStep extends StatefulWidget {
  @override
  _LoadesStanderDurationStepState createState() =>
      _LoadesStanderDurationStepState();
}

class _LoadesStanderDurationStepState extends State<LoadesStanderDurationStep> {
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        showButton = true;
      });
    });
  }

  int _selectedHour = 1;
  bool _isSwitchedOn = false;

  void _toggleSwitch(bool value) {
    setState(() {
      _isSwitchedOn = value;
    });
  }

  void _incrementHour() {
    setState(() {
      if (_selectedHour < 24) _selectedHour++;
    });
  }

  void _decrementHour() {
    setState(() {
      if (_selectedHour > 1) _selectedHour--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<OrderDetailsProvider, GoogleMapProvider, PageViewProvider>(
      builder:
          (context, orderProvider, googleMapProvider, pageProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DurationSelector(
                        selectedHour: _selectedHour,
                        onIncrement: _incrementHour,
                        onDecrement: _decrementHour,
                      ),
                      const SizedBox(height: 20),
                      OpalStandardsSwitch(
                        isSwitchedOn: _isSwitchedOn,
                        onToggle: _toggleSwitch,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            buildConfirmButton(
              
              hint:"تأكيد موقع الإنزال",
                showButton: showButton,
                orderProvider: orderProvider,
                googleMapProvider: googleMapProvider,
                pageProvider: pageProvider,
                onPressed: () {
                  orderProvider.setLatLngEndPoint(
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
