import 'package:flutter/material.dart';
import 'package:opal_user_app/models/prediction.dart';

class ResultSearchList extends StatelessWidget {
  final List<Prediction> predictions;
  final ValueChanged<Prediction> onPredictionSelected;

  const ResultSearchList({
    Key? key,
    required this.predictions,
    required this.onPredictionSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: predictions.length,
        itemBuilder: (context, index) {
          final prediction = predictions[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(prediction.mainTitle),
                subtitle: Text(prediction.description),
                onTap: () => onPredictionSelected(prediction),
              ),
              if (index + 1 != predictions.length)
                const Divider(indent: 20, endIndent: 20),
            ],
          );
        },
      ),
    );
  }
}
