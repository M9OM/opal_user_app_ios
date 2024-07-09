import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class SettingsItem extends StatelessWidget {
  final String iconSvg;
  final String title;
  final VoidCallback onTap;

  SettingsItem(
      {required this.iconSvg, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWidget(bgColor: AppColors.primaryColor, iconSvg: iconSvg),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }
}
