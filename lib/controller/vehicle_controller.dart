import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:opal_user_app/models/vehicle/vehicle_type.dart';

class VehicleController {
  List<VehicleTypeModel> allVehicleTypes = [];

  Future<List<VehicleTypeModel>> loadVehicleTypes() async {
    // Load JSON data from the file
    String jsonString = await rootBundle.loadString('assets/json/vehicle_types.json');
    List<dynamic> jsonData = json.decode(jsonString);

    return jsonData.map<VehicleTypeModel>((item) => VehicleTypeModel.fromJson(item)).toList();
  }

  void setAllVehicleTypes(List<VehicleTypeModel> vehicleTypes) {
    allVehicleTypes = vehicleTypes;
  }
}
