import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/services/services_weather.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromARGB(255, 9, 15, 69),
        title: Text(
          'search city',
          // style: TextStyle(
          //   color: Theme.of(context).primaryColor,
          // ),
          //  style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeather = BlocProvider.of<ShowWeatherCubit>(context);
              getWeather.showWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter city name',
            ),
          ),
        ),
      ),
    );
  }
}
