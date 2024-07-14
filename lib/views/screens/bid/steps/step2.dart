import 'package:flutter/material.dart';
import 'package:opal_user_app/views/screens/bid/components/opalStandardsSwitch.dart';
import 'package:opal_user_app/views/screens/bid/components/ordertype.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';
import 'package:opal_user_app/views/screens/bid/components/tripType.dart';

class StepTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildSection([OrderTypeSelector()], "Order Type"),
          buildSection([TripTypeSelector()], "Round Trip"),
          buildSection([OpalStandardsSwitch()], "OPAL Standards"),
          buildSection([
            buildTextField(
              hint: 'Description / Special Handling',
              controller: TextEditingController(),
            ),
          ], "Description"),
        ],
      ),
    );
  }
}
