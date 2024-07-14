import 'package:flutter/material.dart';

class DurationSelector extends StatefulWidget {
  @override
  _DurationSelectorState createState() => _DurationSelectorState();
}

class _DurationSelectorState extends State<DurationSelector> {
  int selectedHour = 0;

  void onIncrement() {
    setState(() {
      selectedHour++;
    });
  }

  void onDecrement() {
    setState(() {
      if (selectedHour > 0) {
        selectedHour--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: onDecrement,
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 10),
              Text('$selectedHour h'),
              SizedBox(width: 10),
              IconButton(
                onPressed: onIncrement,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
