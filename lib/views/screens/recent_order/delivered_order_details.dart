import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opal_user_app/models/order_recent_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                SvgPicture.asset(order.logo, width: 40.0, height: 40.0),
                const SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.store,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(order.status, style: const TextStyle(color: Colors.green)),
                    Text(order.date),
                    Text('Order ID: ${order.orderId}'),
                  ],
                ),
              ],
            ),
            const Divider(height: 32.0),
            // Assuming deliveryAddress is added to your Order model
            Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(order.deliveryAddress),
                ),
              ],
            ),
            const Divider(height: 32.0),
            const Text('Order Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ...order.orderItems.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(item.description),
                      ],
                    ),
                    Text(item.price),
                  ],
                ),
              );
            }).toList(),
            const Divider(height: 32.0),
            _buildSummaryRow('Total', order.total, isBold: true),
            const SizedBox(height: 16.0),
            _buildSummaryRow('Payment method', order.paymentMethod),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
          Text(value,
              style: isBold ? const TextStyle(fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}
