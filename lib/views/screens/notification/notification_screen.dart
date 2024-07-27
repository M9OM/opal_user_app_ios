import 'package:flutter/material.dart';
import 'package:opal_user_app/models/driver_model.dart';
import 'package:opal_user_app/views/screens/driver_list/driver_list_screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'My Bids'),
            Tab(text: 'General'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          DriverList(
            drivers: Driver.drivers,
            onApply: (Driver) {},
          ),
          GeneralTab(),
        ],
      ),
    );
  }
}

class MyBidsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Bids Notifications'),
    );
  }
}

class GeneralTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('General Notifications'),
    );
  }
}
