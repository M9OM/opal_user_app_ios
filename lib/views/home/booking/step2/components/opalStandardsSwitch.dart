import 'package:flutter/material.dart';

class OpalStandardsSwitch extends StatelessWidget {
  final bool isSwitchedOn;
  final Function onToggle;

  OpalStandardsSwitch({
    required this.isSwitchedOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('OPAL Standards'),
        const SizedBox(height: 10),
        Switch(
          value: isSwitchedOn,
          onChanged: (value) => onToggle(value),
        ),
      ],
    );
  }
}