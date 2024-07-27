import 'package:flutter/material.dart';
import 'package:opal_user_app/views/screens/bid/components/opalStandardsSwitch.dart';
import 'package:opal_user_app/views/screens/bid/components/ordertype.dart';
import 'package:opal_user_app/views/screens/bid/components/pyment_method.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';
import 'package:opal_user_app/views/screens/bid/components/tripType.dart';

class StepTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
                padding: EdgeInsets.zero, // Remove padding from the top

        children: [
          buildSection([OrderTypeSelector()], "Order Type"),
          buildSection([TripTypeSelector()], "Round Trip"),
          buildSection([OpalStandardsSwitch()], "OPAL Standards"),
          buildSection([PaymentMethod()], "Payment Method"),




        ],
      ),
    );
  }
}
