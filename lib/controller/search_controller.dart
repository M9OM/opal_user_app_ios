import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:opal_user_app/config/api_keys.dart';
import 'package:opal_user_app/models/prediction.dart';

class SearchControllerMap {
  Future<List<Prediction>> getPlacePredictions(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=${ApiKeys.googleApiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List predictionsJson = json.decode(response.body)['predictions'];
      return Future.wait(predictionsJson.map((json) async {
        final placeDetails = await getPlaceDetails(json['place_id']);
        return Prediction(
          mainTitle: json['structured_formatting']['main_text'],
          description: json['description'],
          placeId: json['place_id'],
          latitude: placeDetails['lat'] ?? 0.0,
          longitude: placeDetails['lng'] ?? 0.0,
        );
      }).toList());
    } else {
      throw Exception('Failed to load predictions');
    }
  }

  Future<Map<String, double>> getPlaceDetails(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?placeid=$placeId&key=${ApiKeys.googleApiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = json.decode(response.body)['result'];
      return {
        'lat': result['geometry']['location']['lat']?.toDouble() ?? 0.0,
        'lng': result['geometry']['location']['lng']?.toDouble() ?? 0.0,
      };
    } else {
      throw Exception('Failed to load place details');
    }
  }

  Future<String> getMainTitleFromCoordinates(LatLng position) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=${ApiKeys.googleApiKey}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final results = json.decode(response.body)['results'];
      if (results.isNotEmpty) {
        final addressComponents = results[0]['address_components'];
        for (var component in addressComponents) {
          final types = component['types'] as List;
          if (types.contains('route') || types.contains('street_address') || types.contains('sublocality')) {
            return component['long_name'];
          }
        }
        return results[0]['formatted_address']; // Fallback to the full formatted address
      } else {
        return "Unknown Location";
      }
    } else {
      throw Exception('Failed to load location data');
    }
  }

}
