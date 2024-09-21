import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/show_weather_cubit/show_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModell =
        BlocProvider.of<ShowWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getColor(weatherModell.condition),
            getColor(weatherModell.condition)[400]!,
            getColor(weatherModell.condition)[100]!
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModell.cityName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'updated at ${weatherModell.updatedDate.hour}:${weatherModell.updatedDate.minute}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network("https:${weatherModell.image!}"),
                ),
                const SizedBox(
                  width: 70,
                ),
                Text(
                  weatherModell.avTemp.round().toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 70,
                ),
                Column(children: [
                  Text(
                    'MaxTemp:${weatherModell.maxTemp.round()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'MinTemp:${weatherModell.minTemp.round()}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ],
            ),
            Text(
              weatherModell.condition,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
