import 'package:get/get.dart';

import '../models/forecast_model.dart';
import '../services/http_services.dart';

class ForecastVM extends GetxController {
  bool isLoading = false;
  List<ForecastModel> forecastData = [];

  vmGetForecastData() async {
    try {
      isLoading = true;
      update();
      forecastData = await HttpServices().fetchForecastData();
      update();
      isLoading = false;
      update();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
