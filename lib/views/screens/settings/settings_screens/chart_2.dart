import 'package:flutter/material.dart';
import 'package:opal_user_app/config/asset_paths.dart';

class RecentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionsList() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: ListView(
          children: [
            _buildTransactionItem(
                'Received', '2.5 OMR', '07/20/22', '4:32PM', Colors.green),
            _buildTransactionItem(
                'Not Received', '', '07/17/22', '1:48PM', Colors.red),
            _buildTransactionItem(
                'Received', '2.5 OMR', '08/23/22', '4:32PM', Colors.green),
            _buildTransactionItem(
                'Received', '2.5 OMR', '08/20/22', '2:30PM', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date,
      String time, Color amountColor) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0), // Add padding around the entire container
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0), // Add padding around the text
                    decoration: BoxDecoration(
                      color: amountColor.withOpacity(0.2), // Set the background color
                      borderRadius:
                          BorderRadius.circular(20.0), // Set the border radius
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: amountColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 4.0), // Add spacing between title and subtitle
                  Text('$date $time', style: TextStyle(color: Colors.black.withOpacity(0.2)),),
                ],
              ),
              Icon(Icons.arrow_forward_ios,color: Colors.black.withOpacity(0.2))

            ],
          ),
        ),
        Divider(indent: 20,endIndent: 20,)
      ],
    );
  }
}
