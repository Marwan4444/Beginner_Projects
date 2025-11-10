import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';


class GetWeatherCubit extends Cubit<WeatherStates> {
  GetWeatherCubit() : super(NoWeatherState());

  Weathermodel? weathermodel;

  Future<void> getWeather({required String cityName}) async {
     emit(WeatherLoadingstate()); 
    try {
      weathermodel = await WeatherService(dio: Dio()).getcurrentWeather(cityName: cityName);

      if (weathermodel != null) {
        emit(WeatherLoadedState(weathermodel: weathermodel!));
      } else {
        emit(WeatherFailureState());
      }
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
