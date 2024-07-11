import 'package:flutter/material.dart';

class DurationSelector extends StatelessWidget {
  final int selectedHour;
  final Function onIncrement;
  final Function onDecrement;

  DurationSelector({
    required this.selectedHour,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Duration'),
        const SizedBox(height: 10),
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
                onPressed: () => onDecrement(),
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 10),
              Text('$selectedHour h'),
              SizedBox(width: 10),
              IconButton(
                onPressed: () => onIncrement(),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
