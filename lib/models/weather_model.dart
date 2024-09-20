class WeatherModel {
  String description;
  String icon;
  double temperature;
  String country;
  String city;

  WeatherModel({
    required this.description,
    required this.icon,
    required this.temperature,
    required this.country,
    required this.city,
  });

  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      description: map['weather'][0]['description'],
      icon: map['weather'][0]['icon'],
      temperature: map['main']['temp'],
      country: map['sys']['country'],
      city: map['name'],
    );
  }
}
