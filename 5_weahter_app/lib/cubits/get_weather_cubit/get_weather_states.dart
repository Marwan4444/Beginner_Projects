import 'package:weather_app/models/weather_model.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadingstate extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {
  final Weathermodel weathermodel;
  WeatherLoadedState({required this.weathermodel});
}

class WeatherFailureState extends WeatherStates {}
