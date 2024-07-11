import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconWidget extends StatelessWidget {
  final Color bgColor;
  final String iconPath;

  IconWidget({Key? key, required this.bgColor, required this.iconPath}) : super(key: key);

  bool isSvg(String path) {
    return path.endsWith('.svg');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8), // Adjust padding as needed
      child: isSvg(iconPath)
          ? SvgPicture.asset(iconPath, color: bgColor, width: 22,)
          : Image.asset(iconPath, color: bgColor, width: 22,),
    );
  }
}
