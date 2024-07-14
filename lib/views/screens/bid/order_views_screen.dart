import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/views/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class OrderReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order review'),
      ),
      body: Consumer<GoogleMapProvider>(
        builder: (context, googleMapProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    children: [
                      Lottie.asset('assets/icon/chcke.json', width: 100, repeat: false),
                      const SizedBox(height: 8),
                      const Text(
                        'Thank you for your order!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'The order confirmation has been sent to your email address.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '200 Km\nDistance',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Aug. 25th 2024\nOrder time',
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // Clear the provider state if necessary
                    googleMapProvider.clearGoogleProvider();
                    // Navigate and replace to HomeScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    'Back to home',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.email_outlined),
                        SizedBox(height: 4),
                        Text('Open mail app'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.support_agent_outlined),
                        SizedBox(height: 4),
                        Text('Contact support'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(thickness: 1),
                const SizedBox(height: 16),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    backgroundColor: Colors.white,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_outline),
                      SizedBox(width: 8),
                      Text('Rate your experience'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    backgroundColor: Colors.white,
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.reviews_outlined),
                      SizedBox(width: 8),
                      Text('Leave a review'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
