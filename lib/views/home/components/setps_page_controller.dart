import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/views/home/booking/preview_order.dart';
import 'package:opal_user_app/views/home/booking/step1/1vehicle_details_time.dart';
import 'package:opal_user_app/views/home/booking/step2/2stander_duration.dart';
import 'package:provider/provider.dart';

class PageContainer extends StatelessWidget {
  const PageContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 340,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Consumer<PageViewProvider>(
        builder: (context, pageProvider, child) {
          return PageView(
            controller: pageProvider.pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              Provider.of<PageViewProvider>(context, listen: false)
                  .setPage(index);
            },
            children:  [
              VehicleDetailsStep(),
              LoadesStanderDurationStep(),
              const PreViewOrderSteps(),
            ],
          );
        },
      ),
    );
  }
}