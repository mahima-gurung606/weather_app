import 'package:get/get.dart';

import '../models/weather_model.dart';
import '../services/http_services.dart';

class WeatherVM extends GetxController {
  bool isLoading = false;
  WeatherModel? weatherData;

  vmGetWeatherData() async {
    try {
      isLoading = true;
      update();
      weatherData = await HttpServices().fetchWeatherData();
      isLoading = false;
      update();
      return weatherData;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
