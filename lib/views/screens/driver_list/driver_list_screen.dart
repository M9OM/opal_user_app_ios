import 'package:flutter/material.dart';
import 'package:opal_user_app/models/driver_model.dart';
import 'package:opal_user_app/views/screens/driver_list/components/driverListItem.dart';

class DriverList extends StatelessWidget {
  final List<Driver> drivers;
  final Function(Driver) onApply;

  const DriverList({Key? key, required this.drivers, required this.onApply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bids'),),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          return DriverListItem(
            driver: drivers[index],
            onApprove: () {  }, onReject: () {  },
          );
        },
      ),
    );
  }
}
