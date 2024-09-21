import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/services_weather.dart';

class ShowWeatherCubit extends Cubit<WeatherState> {
  ShowWeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;
  showWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).showCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      // TODO
      emit(WeatherFailedState());
    }
  }
}
