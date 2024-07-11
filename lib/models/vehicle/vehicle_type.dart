class VehicleTypeModel {
  final int vehicleTypeID;
  final String name;
  final int parent;
  final String image;
  final bool main;

  VehicleTypeModel({
    required this.vehicleTypeID,
    required this.name,
    required this.parent,
    required this.image,
    required this.main,
  });

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) {
    return VehicleTypeModel(
      vehicleTypeID: json['VehicleTypeID'],
      name: json['VehicleType'],
      parent: json['Parent'],
      image: 'assets/vehice_icon/${json['ICON']}', // Correct the path to match your assets structure
      main: json['Main'] == 'Y',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'VehicleTypeID': vehicleTypeID,
      'VehicleType': name,
      'Parent': parent,
      'ICON': image,
      'Main': main ? 'Y' : 'N',
    };
  }
}
