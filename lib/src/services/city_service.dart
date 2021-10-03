import 'package:dio/dio.dart';
import 'package:weather_app/src/models/city.dart';

class CityService {
  late Dio _dio;
  CityService() {
    _dio = Dio();
  }

  Future<City> findCityByName(String cityName) async {
    Response response = await _dio.get(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cd4b80ffa7a59f7415f0b8a62e2e141e&lang=fr&units=metric");
    return City.fromJson(response.data);
  }
}
