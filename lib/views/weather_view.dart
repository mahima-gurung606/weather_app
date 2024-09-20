import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/weather_vm.dart';

class WeatherView extends StatefulWidget {
  WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherVM ms = Get.find<WeatherVM>();

  @override
  void initState() {
    ms.vmGetWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather of Bhutan"),
        centerTitle: true,
      ),
      body: GetBuilder<WeatherVM>(builder: (_) {
        return customView();
      }),
    );
  }

  Widget customView() {
    if (ms.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (ms.weatherData == null) {
      return Center(
        child: Text("No data found"),
      );
    } else {
      return Container(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "${ms.weatherData!.temperature}°C",
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      );
    }
  }
}
