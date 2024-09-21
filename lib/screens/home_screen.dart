import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_cubit.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_state.dart';
import 'package:weather_app/screens/no_weather.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/weather_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
        title: const Text(
          'Weather App',
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ShowWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return const Text('opsssss there is an error');
          }
        },
      ),
    );
  }
}
