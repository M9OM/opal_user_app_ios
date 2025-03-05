import 'package:flutter/material.dart';
import 'package:opal_user_app/controller/map_controller.dart';
import 'package:opal_user_app/controller/pageview_controller.dart';
import 'package:opal_user_app/controller/vehilce_provider.dart';
import 'package:opal_user_app/service/map_service.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:opal_user_app/views/screens/splash/splash_screen.dart';
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
        ChangeNotifierProvider(create: (_) => PageViewProvider()),
        Provider<GoogleMapService>(
            create: (_) => GoogleMapService()), // For GoogleMapService
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor:AppColors.primaryColor ,
            scaffoldBackgroundColor: AppColors.backgroundColor,
            fontFamily: 'arabic',
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          ),
          home: SplashScreen()),
    );
  }
}




