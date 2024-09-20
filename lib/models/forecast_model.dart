class ForecastModel {
  String dateTime;
  String temperature;
  String icon;

  ForecastModel({
    required this.dateTime,
    required this.temperature,
    required this.icon,
  });

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      dateTime: map['dt_txt'],
      temperature: map['main']['temp'].toString(),
      icon: map['weather'][0]['icon'],
    );
  }
}
