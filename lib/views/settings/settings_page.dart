import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/views/settings/components/settings_item.dart';
import 'package:opal_user_app/views/settings/components/settings_section.dart';
import 'package:opal_user_app/views/settings/components/user_info.dart';
import 'package:opal_user_app/views/settings/settings_screens/payment_methods_page.dart';

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
                iconPath: AssetPaths.languageSvg,
                title: 'Language',
                subtitle: "English",
                onTap: () {
                  // Handle onTap
                },
              ),
              SettingsItem(
                iconPath: AssetPaths.notificationsSvg,
                title: 'Notifications',
                onSwitchChanged: (value) {},
                onTap: () {},
                switchValue: true,
              ),
            ],
          ),
          SettingsSection(
            title: 'Account',
            children: <Widget>[
              SettingsItem(
                iconPath: AssetPaths.cardSvg,
                title: 'Payment Methods',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodsPage(),
                    ),
                  );
                },
              ),
              SettingsItem(
                iconPath: AssetPaths.disableAcountSvg,
                title: 'Disable Account',
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
