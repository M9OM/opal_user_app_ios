import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

import '../../widgets/custom_button.dart';

class PreViewOrderSteps extends StatelessWidget {
  const PreViewOrderSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: IconWidget(
                bgColor: AppColors.primaryColor, iconSvg: AssetPaths.circle),
            title: const Text("Pick Up From"),
            subtitle: const Text("Muscat, Al Amirat"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Container(
              width: 2,
              height: 30,
              color: Colors.red,
            ),
          ),
          ListTile(
            leading:
                IconWidget(bgColor: Colors.green, iconSvg: AssetPaths.boxSvg),
            title: const Text("Drop Off To"),
            subtitle: const Text("Salalah, 342"),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: CustomButton(
              onPressed: () {},
              text: 'تأكيد الطلب',
            ),
          )
        ],
      ),
    );
  }
}
