class Prediction {
  final String mainTitle;
  final String description;
  final String placeId;
  final double latitude;
  final double longitude;

  Prediction({
    required this.mainTitle,
    required this.description,
    required this.placeId,
    required this.latitude,
    required this.longitude,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      mainTitle: json['structured_formatting']['main_text'],
      description: json['description'],
      placeId: json['place_id'],
      latitude: json['geometry']['location']['lat'],
      longitude: json['geometry']['location']['lng'],
    );
  }
}
