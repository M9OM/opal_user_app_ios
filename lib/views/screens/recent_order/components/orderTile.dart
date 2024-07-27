import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:opal_user_app/models/order_recent_model.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/screens/recent_order/delivered_order_details.dart';
import 'package:opal_user_app/views/screens/recent_order/onway_order.dart';
import 'package:opal_user_app/views/widgets/icon_widget.dart';

class OrderTile extends StatelessWidget {
  final Order order;

  OrderTile({required this.order});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${order.date} • ${order.time}'),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 248, 248, 248),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(order.status,
                        style: TextStyle(
                            color: order.status == "Delivered"
                                ? Colors.green
                                : Colors.orange)),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  IconWidget(
                    isbgColor: true,
                      bgColor: order.status == "Delivered"
                          ? Colors.green
                          : Colors.orange,
                      iconPath: order.logo),
                  // SvgPicture.asset(order.logo, width: 35.0),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.store,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('ID: ${order.orderId}'),
                      Text(order.amount),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return order.status=='Delivered'? OrderDetailsScreen(order: order):LiveTrackPage();
                            },
                      ));
                    },
                    child: Text('View details',
                        style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
