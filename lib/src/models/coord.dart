class Coord {
  double lat;
  double lng;

  Coord({
    required this.lat,
    required this.lng,
  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lng: json["lon"],
      lat: json["lat"],
    );
  }
}
