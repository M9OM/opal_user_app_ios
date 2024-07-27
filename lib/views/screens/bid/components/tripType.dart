import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

enum TripType { oneWay, roundTrip }

class TripTypeSelector extends StatefulWidget {
  @override
  _TripTypeSelectorState createState() => _TripTypeSelectorState();
}

class _TripTypeSelectorState extends State<TripTypeSelector> {
  TripType tripType = TripType.oneWay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          MSHCheckbox(
            size: 25,
            value: tripType == TripType.roundTrip,
            onChanged: (bool value) {
              setState(() {
                tripType = value ? TripType.roundTrip : TripType.oneWay;
              });
            },
            style: MSHCheckboxStyle.fillScaleColor,
            colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
              checkedColor: AppColors.primaryColor,
              uncheckedColor: Colors.grey,
              disabledColor: Colors.grey,
            ),
          ),
          SizedBox(width: 8.0),
          Text(
            'Round Trip',
            style: TextStyle(
              color: tripType == TripType.roundTrip
                  ? AppColors.primaryColor
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
