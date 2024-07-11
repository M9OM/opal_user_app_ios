import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/order_detils_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/controller/vehilce_provider.dart';
import 'package:opal_user_app/models/driver_model.dart';
import 'package:opal_user_app/service/map_service.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/auth/login/login_screen.dart';
import 'package:opal_user_app/views/driver_list/driver_list_screen.dart';
import 'package:opal_user_app/views/home/home_screen.dart';
import 'package:opal_user_app/views/settings/settings_page.dart';
import 'package:opal_user_app/views/settings/settings_screens/chart_2.dart';
import 'package:opal_user_app/views/settings/settings_screens/chart_screen.dart';
import 'package:opal_user_app/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null; // Suppress the warning

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VehicleProvider()),

        ChangeNotifierProvider(create: (_) => GoogleMapProvider()),
        ChangeNotifierProvider(create: (_) => OrderDetailsProvider()),
        ChangeNotifierProvider(create: (_) => PageViewProvider()),
        Provider<GoogleMapService>(
            create: (_) => GoogleMapService()), // For GoogleMapService
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.backgroundColor,
          fontFamily: 'arabic',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: HomeScreen()
      ),
    );
  }
}
