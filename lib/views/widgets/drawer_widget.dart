import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Hi Mohammed',
              style: TextStyle(color: Colors.black),
            ),
            accountEmail: Text(
              'mohammedsaid@example.com',
              style: TextStyle(color: Colors.black),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/IMG_0764.png'),
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.5),
            ),
          ),
          ListTile(
            leading: IconWidget(bgColor: AppColors.primaryColor,iconSvg: AssetPaths.houseSvg,),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home
            },
          ),
          ListTile(
            leading: IconWidget(bgColor: AppColors.primaryColor,iconSvg: AssetPaths.settingsSvg,),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Settings
            },
          ),
          ListTile(
            leading: IconWidget(bgColor: AppColors.primaryColor,iconSvg: AssetPaths.instagramSvg,),
            title: Text('@opal_insta'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Account
            },
          ),
          ListTile(
            leading: IconWidget(bgColor: AppColors.primaryColor,iconSvg: AssetPaths.logoutSvg,),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
          ListTile(
            leading: IconWidget(bgColor: AppColors.primaryColor,iconSvg: AssetPaths.infoSvg,),
            title: Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Privacy Policy
            },
          ),
        ],
      ),
    );
  }
}
