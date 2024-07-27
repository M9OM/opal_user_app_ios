import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/edit_profile/edit_profile.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserInfo extends StatelessWidget {
  final String name;
  final String email;
  final String avatarUrl;

  UserInfo({required this.name, required this.email, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.itemBg, borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(avatarUrl),
                  radius: 30.0,
                ),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      email,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
            
              ],
            ),


                        IconButton(onPressed: () {
                          NavHelpers.navigateTo(context, EditProfileScreen());
                        },
                          icon: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.backgroundColor),
                                          child: Icon(
                                            Icons.edit,
                                            size: 18,
                                            color: Colors.black,
                                          )),
                        ),
          ],
        ),
      ),
    );
  }
}
