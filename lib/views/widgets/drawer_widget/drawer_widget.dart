import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/settings/settings_page.dart';
import 'package:opal_user_app/views/widgets/drawer_widget/customDrawerHeader.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
              CustomDrawerHeader(
                accountName: 'John Doe',
                accountEmail: 'johndoe@example.com',
                backgroundImage: 'assets/icon/bg1.png',
                avatarImage: 'assets/images/admin.jpeg',
              ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: AssetPaths.houseSvg,
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Home
            },
          ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: AssetPaths.settingsSvg,
            ),
            title: const Text('Settings'),
            onTap: () {
              NavHelpers.navigateTo(context, SettingsPage());
            },
          ),
          ListTile(
            leading: Stack(
              children: [
                IconWidget(
                  bgColor: AppColors.primaryColor,
                  iconPath: AssetPaths.notificationsSvg,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text('Notification'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Account
            },
          ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: AssetPaths.contactUsSvg,
            ),
            title: const Text('Contact Us'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: 'assets/icon/logocolor.png',
            ),
            title: const Text('About us'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Account
            },
          ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: AssetPaths.infoSvg,
            ),
            title: const Text('Privacy Policy'),
            onTap: () {
              Navigator.pop(context);
              // Navigate to Privacy Policy
            },
          ),
          ListTile(
            leading: IconWidget(
              bgColor: AppColors.primaryColor,
              iconPath: AssetPaths.logoutSvg,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context);
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
