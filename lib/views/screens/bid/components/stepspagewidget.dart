import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';






Widget buildSection(List<Widget> items, String title) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(5),
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...items,
          ],
        ),
      ),
      const SizedBox(height: 10),
    ],
  );
}

Widget buildButton({required String hint, required Function onPressed}) {
  return CustomButton(text: hint, onPressed: () => onPressed());
}

Widget buildTextField({
  required String hint,
  required TextEditingController controller,
  Icon? icon,
}) {
  return Padding(
    padding: const EdgeInsets.all(11),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.dividerColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          suffixIcon: icon ?? SizedBox(),
        ),
        controller: controller,
      ),
    ),
  );
}
