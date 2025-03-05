import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapControllerP with ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> animation;
  LatLng? center;
  bool isLoading = true;
  bool fromConfirmed = false;
  bool toConfirmed = false;

  GoogleMapControllerP(TickerProvider vsync) {
    _initializeAnimation(vsync);
    _getCurrentLocation();
  }

  void _initializeAnimation(TickerProvider vsync) {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: vsync,
    );

    animation = Tween<double>(begin: 30, end: 40).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    center = LatLng(position.latitude, position.longitude);
    isLoading = false;
    notifyListeners();
  }

  void confirmFrom() {
    fromConfirmed = true;
    notifyListeners();
  }

  void confirmTo() {
    toConfirmed = true;
    notifyListeners();
  }

  void startAnimation() {
    animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
