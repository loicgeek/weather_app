import 'package:weather_app/src/user/models/address.dart';
import 'package:weather_app/src/user/models/company.dart';

class User {
  late int id;
  late String name;
  late String username;
  late String website;
  late String phone;
  late String email;
  late Address address;
  late Company company;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.company,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}
