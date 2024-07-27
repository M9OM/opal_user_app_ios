import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: Text('Confirm'),
        ),
      ],
    );
  }
}

void showConfirmDialog(
  BuildContext context, {
  required String title,
  required String content,
  required VoidCallback onConfirm,
  required VoidCallback onCancel,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ConfirmDialog(
        title: title,
        content: content,
        onConfirm: onConfirm,
        onCancel: onCancel,
      );
    },
  );
}
