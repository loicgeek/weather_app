import 'package:weather_app/src/models/coord.dart';
import 'package:weather_app/src/models/temperature.dart';
import 'package:weather_app/src/models/weather.dart';

class City {
  int id;
  String name;
  int cod;
  Coord coord;
  Temperature temperature;
  List<Weather> weather;

  City({
    required this.id,
    required this.name,
    required this.cod,
    required this.coord,
    required this.temperature,
    required this.weather,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"],
      name: json["name"],
      cod: json["cod"],
      coord: Coord.fromJson(json['coord']),
      temperature: Temperature.fromJson(json['main']),
      weather: List<Weather>.from(
        json['weather'].map(
          (w) => Weather.fromJson(w),
        ),
      ),
    );
  }
}
