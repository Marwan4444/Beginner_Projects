import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';

import 'package:weather_app/views/searchView.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import 'package:weather_app/widgets/weather_failure.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.wb_sunny, color: Colors.white, size: 28),
            SizedBox(width: 8),
            Text(
              "Weather App",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Searchview()));
              },
              icon: const Icon(Icons.search),
              iconSize: 30,
              style: const ButtonStyle(
                 
                  ),
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weathermodel: state.weathermodel,
            );
          } else if (state is WeatherLoadingstate) {
            // ignore: prefer_const_constructors
            return Skeletonizer(
                enabled: true,
                child: WeatherInfoBody(
                  weathermodel: Weathermodel.empty(),
                )
                );
          } else if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else {
            return const ErrorScreen();
          }
        },
      ),
    );
  }
}
