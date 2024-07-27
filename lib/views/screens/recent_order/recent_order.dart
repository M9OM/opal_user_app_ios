import 'package:flutter/material.dart';
import 'package:opal_user_app/models/order_recent_model.dart';
import 'package:opal_user_app/views/screens/recent_order/components/orderTile.dart';

class OrderListScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
      date: "Jul 09",
      time: "12:48am",
      store: "Salalah - Muscat",
      orderId: "1654244177",
      amount: "OMR 3.830",
      items: 2,
      status: "On the way",
      logo: "assets/icon/truck-side.svg",
      deliveryAddress: "muscat-alamirat-4xxds",
      orderItems: [
        OrderItem(name: "Order Type", description: "", price: "Fixed Price"),
        OrderItem(name: "distance", description: "", price: "1040km"),
      ],
      total: "OMR 2.370",
      paymentMethod: "Credit Card",
    ),
    Order(
      date: "Jul 05",
      time: "12:18am",
      store: "Salalah - Muscat",
      orderId: "1648483108",
      amount: "OMR 2.770",
      items: 1,
      status: "Delivered",
      logo: "assets/icon/truck-check.svg",
      deliveryAddress: "muscat-alamirat-4xxds",
      orderItems: [
        OrderItem(name: "Order Type", description: "", price: "Bid"),
        OrderItem(name: "distance", description: "", price: "1040km"),
      ],
      total: "OMR 12.370",
      paymentMethod: "Credit Card",
    ),
    Order(
      date: "May 26",
      time: "11:46pm",
      store: "Salalah - Muscat",
      orderId: "1592087335",
      amount: "OMR 2.370",
      items: 2,
      status: "Delivered",
      logo: "assets/icon/truck-check.svg",
      deliveryAddress: "Muscat-alamirat-4xxds",
      orderItems: [
        OrderItem(name: "Order Type", description: "", price: "Urgent"),
        OrderItem(name: "distance", description: "", price: "1040km"),
      ],
      total: "OMR 12.370",
      paymentMethod: "Credit Card",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderTile(order: orders[index]);
        },
      ),
    );
  }
}
