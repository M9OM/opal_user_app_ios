import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
   IconWidget({super.key, required this.bgColor, required this.iconSvg});
final Color bgColor;
final String iconSvg;

  @override
  Widget build(BuildContext context) {
    return  Container(
            decoration: BoxDecoration(
              color:bgColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8), // Adjust padding as needed
            // ignore: deprecated_member_use
            child: SvgPicture.asset(iconSvg, color: bgColor),
          );
  }
}