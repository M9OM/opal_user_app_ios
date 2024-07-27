import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class SettingsItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final VoidCallback onTap;
  final String? subtitle;
  final bool? switchValue;
  final Color bgColor;
  final ValueChanged<bool>? onSwitchChanged;

  SettingsItem({
    required this.iconPath,
    required this.title,
    required this.onTap,
    this.subtitle,
   required this.bgColor,
    this.switchValue,
    this.onSwitchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconWidget(                    isbgColor: true,
bgColor: bgColor, iconPath: iconPath),
          title: Text(title),
          subtitle: subtitle != null ? Text(subtitle!) : null,
          trailing: switchValue != null
              ? Transform.scale(
                  scale: 0.75, // Adjust the scale factor as needed
                  child: Switch(
                    value: switchValue!,
                    onChanged: onSwitchChanged,
                  ),
                )
              : const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
        const Divider(
          indent: 60,
          endIndent: 30,
        ),
      ],
    );
  }
}
