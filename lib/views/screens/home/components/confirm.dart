import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';

Widget buildConfirmButton({
    required GoogleMapProvider googleMapProvider,
    required PageViewProvider pageProvider,
    required bool showButton,
    required Function() onPressed, required String hint
  }) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: showButton ? 50 : 0,
        child: showButton
            ? CustomButton(
                onPressed: onPressed,
                text: hint,
                color: AppColors.primaryColor,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
