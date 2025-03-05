import 'package:flutter/material.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';

class StepThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildSection([
            buildTextField(
              hint: 'Description / Special Handling',
              controller: TextEditingController(),
            ),
          ], "Description"),
          buildSection([
            buildTextField(
              hint: 'Attach',
              controller: TextEditingController(),
              icon: Icon(Icons.camera_alt),
            ),
          ], "Attach"),
        ],
      ),
    );
  }
}
