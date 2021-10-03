import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';

class CityDetails extends StatefulWidget {
  final City city;
  const CityDetails({
    Key? key,
    required this.city,
  }) : super(key: key);

  @override
  _CityDetailsState createState() => _CityDetailsState();
}

class _CityDetailsState extends State<CityDetails> {
  late City city;
  @override
  void initState() {
    city = widget.city;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${city.name}"),
      ),
      body: Column(
        children: [
          Card(
            child: Row(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${city.temperature.temp}"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
