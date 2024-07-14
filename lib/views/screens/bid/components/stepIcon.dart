import 'package:flutter/material.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class StepIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  StepIcon({
    required this.iconPath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          
          IconWidget(
            iconPath: iconPath,
            bgColor: isSelected ? Colors.green : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
