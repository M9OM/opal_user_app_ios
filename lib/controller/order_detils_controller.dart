import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:opal_user_app/config/api_keys.dart';
import 'package:opal_user_app/utils/app_colors.dart';
import 'package:http/http.dart' as http;

class OrderDetailsProvider extends ChangeNotifier {
  String? _selectedVehicleType;
  String? _selectedVehicleTon;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  LatLng? _startPoint;
  LatLng? _endPoint;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  LatLng? get startPoint => _startPoint;
  LatLng? get endPoint => _endPoint;
  String? get selectedVehicleType => _selectedVehicleType;
  String? get selectedVehicleTon => _selectedVehicleTon;
  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? get selectedTime => _selectedTime;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines;

  void setLatLngStartPoint(LatLng point) {
    _startPoint = point;
    _markers.add(
      Marker(
        markerId: MarkerId('startPoint'),
        position: point,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
    notifyListeners();
    _updatePolylines();
  }

  void setLatLngEndPoint(LatLng point) {
    _endPoint = point;
    _markers.add(
      Marker(
        markerId: MarkerId('endPoint'),
        position: point,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    notifyListeners();
    _updatePolylines();
  }

  Future<List<LatLng>> getDirections(LatLng start, LatLng end) async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${start.latitude},${start.longitude}&destination=${end.latitude},${end.longitude}&key=${ApiKeys.googleApiKey}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> steps = data['routes'][0]['legs'][0]['steps'];

      return steps.map((step) {
        final startLocation = step['start_location'];
        return LatLng(startLocation['lat'], startLocation['lng']);
      }).toList();
    } else {
      throw Exception('Failed to load directions');
    }
  }

  Future<void> _updatePolylines() async {
    if (_startPoint != null && _endPoint != null) {
      // Here you would call a service to get directions.
      // For simplicity, let's assume you have a method getDirections that fetches the route from an API.
      final directions = await getDirections(_startPoint!, _endPoint!);
      _polylines = {
        Polyline(
          polylineId: PolylineId('route'),
          points: directions,
          color: AppColors.primaryColor,
          width: 5,
        ),
      };
      notifyListeners();
    }
  }

  void setSelectedVehicleType(String vehicleType) {
    _selectedVehicleType = vehicleType;
    if (_selectedVehicleType != 'Truck') {
      _selectedVehicleTon = null;
    }
    notifyListeners();
  }

  void setSelectedVehicleTon(String vehicleTon) {
    _selectedVehicleTon = vehicleTon;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setSelectedTime(TimeOfDay time) {
    _selectedTime = time;
    notifyListeners();
  }

  void submitOrder() {
    // Implement order submission logic here
    print('Order Details:');
    print('Vehicle Type: $_selectedVehicleType');
    print('Vehicle Ton: $_selectedVehicleTon');
    print('Date: $_selectedDate');
    print('Time: $_selectedTime');
  }
}
