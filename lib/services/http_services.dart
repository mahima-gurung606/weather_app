import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import '../constants/contant.dart';
import '../models/forecast_model.dart';
import '../models/weather_model.dart';
import 'location_services.dart';

class HttpServices {
  Future<WeatherModel> fetchWeatherData() async {
    Position position = await LocationServices().determinePosition();
    final endPoint =
        "?lat=${position.latitude}&lon=${position.longitude}&appid=";
    final url = "${baseUrlWeather}${endPoint}${key}&units=metric";
    final response = await http.get(Uri.parse(url));
    final weatherData = jsonDecode(response.body);
    print("WeatherDataaaaaaaaaaaaaaaa: ${weatherData}");
    return WeatherModel.fromMap(weatherData);
  }

  Future<List<ForecastModel>> fetchForecastData() async {
    Position position = await LocationServices().determinePosition();
    final endPoint =
        "?lat=${position.latitude}&lon=${position.longitude}&appid=";
    final url = "${baseUrlForecast}${endPoint}${key}&units=metric";
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    final List forecastData = data['list'];
    print("Forecast Dataaaaaaaaaaaaaaaaa: ${forecastData}");
    return forecastData
        .map((forecast) => ForecastModel.fromMap(forecast))
        .toList();
  }
}
