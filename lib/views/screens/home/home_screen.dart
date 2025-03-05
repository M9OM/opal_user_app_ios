import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:opal_user_app/views/screens/home/components/map_widget.dart';
import 'package:opal_user_app/views/screens/home/components/setLoction.dart';
import 'package:opal_user_app/views/widgets/drawer_widget/drawer_widget.dart';

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
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.67,
            width: screenWidth,
            child: Stack(
              children: [
                const GoogleMapScreen(),
                Positioned(
                  top: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                            child: SvgPicture.asset(
                              'assets/icon/bars-sort.svg',
                              width: 15,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Scrollable widget taking 30% of the screen height
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: SetVehicle(),
            ),
          ),
        ],
      ),
    );
  }
}
