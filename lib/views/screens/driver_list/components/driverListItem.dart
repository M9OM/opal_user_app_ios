import 'package:flutter/material.dart';
import 'package:opal_user_app/models/driver_model.dart';

class DriverListItem extends StatelessWidget {
  final Driver driver;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const DriverListItem({
    Key? key,
    required this.driver,
    required this.onApprove,
    required this.onReject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(driver.avatarUrl),
            radius: 30.0,
          ),
          title: Row(
            children: [
              Text(
                driver.name,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                driver.time,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14.0,
                ),
              ),
            ],
          ),
          subtitle: Text(driver.price),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  child: Icon(Icons.check, color: Colors.green),
                  onTap: onApprove,
                ),
              ),
              const SizedBox(width: 8.0),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  child: Icon(Icons.clear, color: Colors.red),
                  onTap: onReject,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
