import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/views/home/booking/confirm.dart';
import 'package:opal_user_app/views/home/booking/step3/components/descriptionInput.dart';
import 'package:opal_user_app/views/home/booking/step3/components/tripType.dart';
import 'package:provider/provider.dart';
class Step3Page extends StatelessWidget {
  const Step3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer3<OrderDetailsProvider, GoogleMapProvider, PageViewProvider>(
      builder: (context, orderProvider, googleMapProvider, pageProvider, child) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description / Special Handling'),
                        const SizedBox(height: 10),

                      DescriptionInput(),
                      const SizedBox(height: 10),
                      TripTypeSelector(),
                    ],
                  ),
                ),
              ),
            ),
            buildConfirmButton(
              showButton: true,
              orderProvider: orderProvider,
              googleMapProvider: googleMapProvider,
              pageProvider: pageProvider,
              hint: "m",
              onPressed: () {
              orderProvider.setLatLngEndPoint(
                    googleMapProvider.currentPosition,
                  );
                pageProvider.nextPage();
              },
            ),
            const SizedBox(height: 30),
          ],
        );
      },
    );
  }
}
