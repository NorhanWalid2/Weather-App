import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c8d5bba22abd44eaaef63313241608';
  WeatherServices(this.dio);
  Future<WeatherModel> showCurrentWeather({required String cityName}) async {
    try {
      Response respose = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(respose.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oooops there is an error try again please';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('there is an error try agin please after few seconds');
    }
  }
}
