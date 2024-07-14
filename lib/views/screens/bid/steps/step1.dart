import 'package:flutter/material.dart';
import 'package:opal_user_app/views/screens/bid/components/DateSelector.dart';
import 'package:opal_user_app/views/screens/bid/components/LoadCounter.dart';
import 'package:opal_user_app/views/screens/bid/components/durationSelector.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';

class StepOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildSection([LoadCounter()], "Loads"),
          buildSection([
            DateSelector(),
          ], "Select Date & Time"),
          buildSection([
            DurationSelector(),
          ], "Duration")
        ],
      ),
    );
  }
}



