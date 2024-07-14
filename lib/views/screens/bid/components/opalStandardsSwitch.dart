import 'package:flutter/material.dart';

class OpalStandardsSwitch extends StatefulWidget {
  @override
  _OpalStandardsSwitchState createState() => _OpalStandardsSwitchState();
}

class _OpalStandardsSwitchState extends State<OpalStandardsSwitch> {
  bool isSwitchedOn = false;

  void onToggle(bool value) {
    setState(() {
      isSwitchedOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Switch(
          value: isSwitchedOn,
          onChanged: onToggle,
        ),
      ],
    );
  }
}
