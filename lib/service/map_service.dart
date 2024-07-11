import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:opal_user_app/config/api_keys.dart';

class GoogleMapService {
  final Completer<GoogleMapController> controller = Completer();
  GoogleMapController? mapController;

  Future<PlaceDetails?> getPlaceDetails(String placeId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${ApiKeys.googleApiKey}'),
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['result'] != null) {
          return PlaceDetails.fromJson(jsonResponse['result']);
        } else {
          print('Place details result is null.');
          return null;
        }
      } else {
        print('Failed to fetch place details. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching place details: $e');
      return null;
    }
  }
}

class PlaceDetails {
  final Geometry geometry;

  PlaceDetails({required this.geometry});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      geometry: Geometry.fromJson(json['geometry']),
    );
  }
}

class Geometry {
  final Location location;

  Geometry({required this.location});

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
