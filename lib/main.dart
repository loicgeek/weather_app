import 'package:flutter/material.dart';
import 'package:weather_app/src/user/pages/users_pages.dart';
import 'package:weather_app/src/weather/pages/weather_app.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersPage(),
    );
  }
}
