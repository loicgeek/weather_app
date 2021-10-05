class Geo {
  late double latitude;
  late double longitude;

  Geo({
    required this.latitude,
    required this.longitude,
  });

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      latitude: double.parse(json['lat']),
      longitude: double.parse(json['lng']),
    );
  }
}
