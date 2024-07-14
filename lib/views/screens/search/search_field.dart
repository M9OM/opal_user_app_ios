import 'package:flutter/material.dart';
import 'package:opal_user_app/models/prediction.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final List<Prediction> predictions;
  final ValueChanged<String> onChanged;
  final ValueChanged<Prediction> onPredictionSelected;
  final FocusNode focusNode;

  const SearchField({
    Key? key,
    required this.controller,
    required this.label,
    required this.predictions,
    required this.onChanged,
    required this.onPredictionSelected,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: label,
            border: InputBorder.none, // This line removes the bottom border
          ),
          onChanged: onChanged,
        ),

      ],
    );
  }
}
