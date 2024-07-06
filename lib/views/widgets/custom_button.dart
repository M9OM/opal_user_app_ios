import 'package:flutter/material.dart';
import 'package:opal_user_app/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double fontSize;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.fontSize = 14.0,
    this.padding = const EdgeInsets.all(12.0),
    this.borderRadius = 20.0,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation:10,
        shadowColor:color.withOpacity(0.5),
        backgroundColor: color,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ), child: Text(
        text,
        textAlign:TextAlign.center ,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: fontSize,
        ),)
    );
  }
}
