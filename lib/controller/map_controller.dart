import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/postion.dart';

class GoogleMapProvider with ChangeNotifier {
  GoogleMapController? _mapController;
  LatLng _currentPosition = markerPosition; // Default position

  GoogleMapController? get mapController => _mapController;
  LatLng get currentPosition => _currentPosition;

  set mapController(GoogleMapController? controller) {
    _mapController = controller;
    notifyListeners();
  }

  void updateCurrentPosition(LatLng newPosition) {
    _currentPosition = newPosition;
    notifyListeners();
  }

  void disposeController() {
    _mapController?.dispose();
  }
}
