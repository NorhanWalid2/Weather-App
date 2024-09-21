import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_cubit.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_state.dart';
import 'package:weather_app/screens/home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ShowWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<ShowWeatherCubit, WeatherState>(
              builder: (context, State) {
            return MaterialApp(
              theme: ThemeData(
                // primaryColor: getColor(
                //     BlocProvider.of<ShowWeatherCubit>(context)
                //         .weatherModel
                //         ?.condition),
                appBarTheme: AppBarTheme(
                  backgroundColor: getColor(
                      BlocProvider.of<ShowWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: getColor(BlocProvider.of<ShowWeatherCubit>(context)
                          .weatherModel
                          ?.condition),
                    ),
                  ),
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          }),
        ));
  }
}

MaterialColor getColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.orange;
    case 'partly cloudy':
    case 'cloudy':
    case 'overcast':
      return Colors.grey;
    case 'mist':
    case 'fog':
    case 'freezing fog':
      return Colors.blueGrey;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'patchy light drizzle':
    case 'light rain':
    case 'light rain shower':
    case 'patchy light rain':
    case 'moderate rain':
    case 'moderate rain at times':
    case 'heavy rain':
    case 'heavy rain at times':
    case 'torrential rain shower':
    case 'moderate or heavy rain shower':
      return Colors.blue;
    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
    case 'light snow showers':
    case 'moderate snow':
    case 'patchy moderate snow':
    case 'heavy snow':
    case 'patchy heavy snow':
    case 'blizzard':
    case 'moderate or heavy snow showers':
    case 'moderate or heavy snow with thunder':
      return Colors.lightBlue;
    case 'patchy sleet possible':
    case 'light sleet':
    case 'light sleet showers':
    case 'moderate or heavy sleet':
    case 'moderate or heavy sleet showers':
      return Colors.blueGrey;
    case 'patchy freezing drizzle possible':
    case 'freezing drizzle':
    case 'heavy freezing drizzle':
    case 'light freezing rain':
    case 'moderate or heavy freezing rain':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'blowing snow':
    case 'ice pellets':
    case 'light showers of ice pellets':
    case 'moderate or heavy showers of ice pellets':
      return Colors.cyan;
    default:
      return Colors.grey; // Fallback for any unknown conditions
  }
}
