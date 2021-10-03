import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/models/city.dart';
import 'package:weather_app/src/pages/city_details.dart';
import 'package:weather_app/src/services/city_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  late CityService _cityService;
  String? error;
  bool isLoading = false;
  @override
  void initState() {
    _searchController = TextEditingController();
    _cityService = CityService();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Enter the city name",
                hintText: "Douala",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            if (error != null)
              Text(
                error!,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (isLoading == true)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: GestureDetector(
                onTap: () async {
                  error = null;
                  print(_searchController.text);
                  if (_searchController.text.isEmpty) {
                    error = "Please enter a city name";
                    setState(() {});
                    return;
                  }

                  try {
                    setState(() {
                      isLoading = true;
                    });
                    City city = await _cityService
                        .findCityByName(_searchController.text);
                    setState(() {
                      isLoading = false;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => CityDetails(
                          city: city,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                    if ((e as DioError).response != null) {
                      error = e.response!.data['message'];
                    }

                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 15,
                    ),
                    child: Text(
                      "Search",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
