import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:opal_user_app/config/api_keys.dart';

class GoogleMapService with ChangeNotifier {
  final TextEditingController controllerSearch = TextEditingController();
  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  GoogleMapController? mapController;

  Future<void> searchAndNavigate() async {
    final response = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=${controllerSearch.text}&key=${ApiKeys.googleApiKey}&language=en',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final predictions = data['predictions'];

      if (predictions.isNotEmpty) {
        final placeId = predictions[0]['place_id'];
        final placeDetails = await getPlaceDetails(placeId);

        final lat = placeDetails['geometry']['location']['lat'];
        final lng = placeDetails['geometry']['location']['lng'];
        final address = placeDetails['formatted_address'];

        mapController?.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(lat, lng),
          ),
        );

        print('Address in Arabic: $address');
      }
    } else {
      throw Exception('Failed to load autocomplete results');
    }
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final response = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=${ApiKeys.googleApiKey}&language=ar',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['result'];
    } else {
      throw Exception('Failed to load place details');
    }
  }

  Future<String> getAddressFromLatLng(double lat, double lng) async {
    final response = await http.get(
      Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=${ApiKeys.googleApiKey}&language=ar',
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      print(data['results'][0]['formatted_address']);
      if (data['results'].isNotEmpty) {
        return data['results'][0]['formatted_address'];
      } else {
        throw Exception('No results found');
      }
    } else {
      throw Exception('Failed to load address');
    }
  }
}