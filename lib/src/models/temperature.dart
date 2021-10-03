class Temperature {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num humidity;

  Temperature({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json["temp_min"],
      tempMax: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
