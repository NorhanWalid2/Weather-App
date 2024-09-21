class WeatherModel {
  final String cityName;
  final DateTime updatedDate;
  final String? image;
  final double avTemp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel(
      {required this.cityName,
      required this.updatedDate,
      this.image,
      required this.avTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.condition});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      updatedDate: DateTime.parse(json['current']['last_updated']),
      avTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
