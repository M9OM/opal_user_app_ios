import 'package:flutter/material.dart';
import 'package:opal_user_app/models/vehicle/vehicle_type.dart';
import 'package:opal_user_app/controller/vehicle_controller.dart';

class VehicleProvider with ChangeNotifier {
  String _selectedVehicleType = '';
  List<VehicleTypeModel> _mainVehicleTypes = [];
  List<VehicleTypeModel> _subVehicleTypes = [];
  VehicleTypeModel? _selectedVehicleSubtype;
  final VehicleController _vehicleController = VehicleController();

  String get selectedVehicleType => _selectedVehicleType;
  List<VehicleTypeModel> get mainVehicleTypes => _mainVehicleTypes;
  List<VehicleTypeModel> get subVehicleTypes => _subVehicleTypes;
  VehicleTypeModel? get selectedVehicleSubtype => _selectedVehicleSubtype;

  void setSelectedVehicleType(VehicleTypeModel type) {
    _selectedVehicleType = type.name;
    _subVehicleTypes = _vehicleController.allVehicleTypes
        .where((subType) => subType.parent == type.vehicleTypeID)
        .toList();
    notifyListeners();
  }

  void setSelectedVehicleSubtype(VehicleTypeModel subtype) {
    _selectedVehicleSubtype = subtype;
    notifyListeners();
  }

  Future<void> loadAndSetVehicleTypes() async {
    List<VehicleTypeModel> vehicleTypes = await _vehicleController.loadVehicleTypes();
    _vehicleController.setAllVehicleTypes(vehicleTypes);
    _mainVehicleTypes = vehicleTypes.where((type) => type.main).toList();
    notifyListeners();
  }
}
