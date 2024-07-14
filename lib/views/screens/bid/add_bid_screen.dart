import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';
import 'package:opal_user_app/utils/helper/nav_helper.dart';
import 'package:opal_user_app/views/screens/bid/components/stepspagewidget.dart';
import 'package:opal_user_app/views/screens/bid/order_views_screen.dart';
import 'package:opal_user_app/views/screens/bid/steps/step1.dart';
import 'package:opal_user_app/views/screens/bid/steps/step2.dart';
import 'package:opal_user_app/views/screens/bid/components/stepIcon.dart';
import 'package:opal_user_app/views/screens/bid/steps/step3.dart';
import 'package:opal_user_app/views/widgets/custom_button.dart';

class StepFormPage extends StatefulWidget {
  @override
  _StepFormPageState createState() => _StepFormPageState();
}

class _StepFormPageState extends State<StepFormPage> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 70), // Adjust this value to create more space at the top
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StepIcon(
                  iconPath: "assets/icon/calendar-clock.svg",
                  label: 'Time & loads',
                  isSelected: _currentPage == 0,
                  onTap: () => _navigateToPage(0),
                ),
                Flexible(
                  child: Container(
                    height: 1.0,
                    color: Colors.grey, // Adjust color as needed
                  ),
                ),
                StepIcon(
                  iconPath: AssetPaths.boxSvg,
                  label: 'Order & Description',
                  isSelected: _currentPage == 1,
                  onTap: () => _navigateToPage(1),
                ),
                Flexible(
                  child: Container(
                    height: 1.0,
                    color: Colors.grey, // Adjust color as needed
                  ),
                ),
                StepIcon(
                  iconPath: "assets/icon/check (1).png",
                  label: 'Attach & Confirm',
                  isSelected: _currentPage == 2,
                  onTap: () => _navigateToPage(2),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                StepOne(),
                StepTwo(),
                StepThree(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: _currentPage == 2 ? "Confirm your order" : 'Next',
              onPressed: () {
                if (_currentPage == 2) {
                  NavHelpers.navigateTo(context, OrderReviewScreen());
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
