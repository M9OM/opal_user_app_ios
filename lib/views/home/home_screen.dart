import 'package:flutter/material.dart';
import 'package:opal_user_app/views/home/booking/step1/step1.dart';
import 'package:opal_user_app/views/home/booking/step2/step2.dart';
import 'package:opal_user_app/views/home/booking/preview_order.dart';
import 'package:opal_user_app/views/home/components/map_widget.dart';
import 'package:opal_user_app/views/home/components/setps_page_controller.dart';
import 'package:opal_user_app/views/widgets/drawer_widget/drawer_widget.dart';
import 'package:provider/provider.dart';
import '../../controller/pageview_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
        final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
            key: _scaffoldKey, // Assign the GlobalKey to the Scaffold

      drawer: DrawerWidget(),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
           MapWidget(onTapDr:(){
              _scaffoldKey.currentState?.openDrawer();

          }), // Your map widget
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: screenHeight*0.40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: const Offset(0, 3), // Shadow position
                    ),
                  ],
                ),
                child: const PageContainer()
              ),
            ),
          ),
        ],
      ),
    );
  }
}
