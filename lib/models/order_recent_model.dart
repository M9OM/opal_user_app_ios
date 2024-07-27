class Order {
  final String date;
  final String time;
  final String store;
  final String orderId;
  final String amount;
  final int items;
  final String status;
  final String logo;
  final String deliveryAddress;
  final List<OrderItem> orderItems;
  final String total;
  final String paymentMethod;

  Order({
    required this.date,
    required this.time,
    required this.store,
    required this.orderId,
    required this.amount,
    required this.items,
    required this.status,
    required this.logo,
    required this.deliveryAddress,
    required this.orderItems,
    required this.total,
    required this.paymentMethod,
  });
}

class OrderItem {
  final String name;
  final String description;
  final String price;

  OrderItem({
    required this.name,
    required this.description,
    required this.price,
  });
}
