import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/views/settings/components/settings_item.dart';
import 'package:opal_user_app/views/settings/components/settings_section.dart';
import 'package:opal_user_app/views/settings/components/user_info.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          UserInfo(
            name: 'John Doe',
            email: 'john.doe@example.com',
            avatarUrl: 'assets/images/admin.jpeg',
          ),
          SettingsSection(
            title: 'General',
            children: <Widget>[
              SettingsItem(
                iconSvg: AssetPaths.languageSvg,
                title: 'Language',
                onTap: () {
                  // Handle onTap
                },
              ),
              SettingsItem(
                iconSvg: AssetPaths.notificationsSvg,
                title: 'Notifications',
                onTap: () {
                  // Handle onTap
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            children: <Widget>[
              SettingsItem(
                iconSvg: AssetPaths.infoSvg,
                title: 'Privacy',
                onTap: () {
                  // Handle onTap
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}
