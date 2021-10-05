import 'package:dio/dio.dart';
import 'package:weather_app/src/user/models/user.dart';

class UserService {
  late Dio _dio;
  UserService() {
    this._dio = Dio();
  }

  Future<List<User>> fetchAllUsers() async {
    Response response =
        await this._dio.get("https://jsonplaceholder.typicode.com/users");

    List<User> listData = [];
    for (var i = 0; i < response.data.length; i++) {
      listData.add(User.fromJson(response.data[i]));
    }
    return listData;
  }

  Future<User> fetchUserDetails(int id) async {
    Response response =
        await this._dio.get("https://jsonplaceholder.typicode.com/users/$id");
    return User.fromJson(response.data);
  }
}
