import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/postion.dart';
import 'package:opal_user_app/controller/search_controller.dart';
import 'package:opal_user_app/service/map_service.dart';

class GoogleMapProvider with ChangeNotifier {
  GoogleMapController? _mapController;
  LatLng _currentPosition = markerPosition; // Default position (Amman)
  LatLng? _fromPosition;
  LatLng? _toPosition;
  String _fromTitle = "";
  String _toTitle = "";
  Timer? _debounce;
   bool _from = true;
  bool _confirmDrop = false;
  Set<Polyline> _polylines = {};

  final SearchControllerMap _searchController = SearchControllerMap();

  GoogleMapController? get mapController => _mapController;
  LatLng get currentPosition => _currentPosition;
  LatLng? get fromPosition => _fromPosition;
  LatLng? get toPosition => _toPosition;
  String get fromTitle => _fromTitle;
  String get toTitle => _toTitle;
  bool get from => _from;
  bool get confirmDrop => _confirmDrop;

  Set<Polyline> get polylines => _polylines;
  void clearGoogleProvider() {
    _fromPosition = null;
    _toPosition = null;
    _fromTitle='';
    _toTitle = '';
    _confirmDrop = false;
    _polylines.clear;
    _mapController ;
    _from = true;
    notifyListeners();
  }

  set mapController(GoogleMapController? controller) {
    _mapController = controller;
    notifyListeners();
  }

  void updateCurrentPosition(LatLng newPosition, bool isFrom) {
    _currentPosition = newPosition;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      if (isFrom) {
        _fromPosition = newPosition;
        _fromTitle = await _updateMainTitle(newPosition);
      } else {
        _toPosition = newPosition;
        _toTitle = await _updateMainTitle(newPosition);
      }
      notifyListeners();
    });
  }
 void confirmDropPickOff(bool confirmDrop) {
    _confirmDrop = confirmDrop;
    notifyListeners();
  }
  void updateFrom(bool from) {
    _from = from;
    notifyListeners();
  }

  Future<String> _updateMainTitle(LatLng position) async {
    final title = await _searchController.getMainTitleFromCoordinates(position);
    return title.isNotEmpty ? title : "Unknown Location";
  }

  Set<Marker> get markers {
    final Set<Marker> markers = {};
    if (_fromPosition != null) {
      markers.add(Marker(
        markerId: MarkerId('fromPosition'),
        position: _fromPosition!,
        infoWindow: InfoWindow(title: 'From: $_fromTitle'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    }
    if (_toPosition != null) {
      markers.add(Marker(
        markerId: MarkerId('toPosition'),
        position: _toPosition!,
        infoWindow: InfoWindow(title: 'To: $_toTitle'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      ));
    }
    return markers;
  }
  Future<void> getDirections() async {
    if (_fromPosition != null && _toPosition != null) {
      final directions = await DirectionsService().getDirections(_fromPosition!, _toPosition!);
      if (directions != null) {
        _polylines = {
          Polyline(
            polylineId: const PolylineId('route'),
            points: directions,
            color: Colors.blue,
            width: 5,
          ),
        };
        _adjustCameraToShowRoute();
        notifyListeners();
      }
    }
  }

  void _adjustCameraToShowRoute() {
    if (_mapController != null && _fromPosition != null && _toPosition != null) {
      LatLngBounds bounds = LatLngBounds(
        southwest: LatLng(
          min(_fromPosition!.latitude, _toPosition!.latitude),
          min(_fromPosition!.longitude, _toPosition!.longitude),
        ),
        northeast: LatLng(
          max(_fromPosition!.latitude, _toPosition!.latitude),
          max(_fromPosition!.longitude, _toPosition!.longitude),
        ),
      );
      _mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    }
  }

  void disposeController() {
    _mapController?.dispose();
    _debounce?.cancel();
  }
}
