import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio  dio;

  WeatherService({required this.dio});
  Future<Weathermodel? > getcurrentWeather({required String cityName}) async
  { {
    try{
         Response response = await dio.get('https://api.weatherapi.com/v1/forecast.json?key=205604476cb94f49bce103123250209&q=$cityName&days=1');
    
  Weathermodel weathermodel = Weathermodel.fromJson(response.data);

  return weathermodel;

    }
   on DioException catch(e){
    final String errorMessage = e.response?.data['error']['message'] ??
     'An error occurred';
    throw Exception(errorMessage);
    }
    catch(e){
      throw Exception('An error occurred');
    }


  }

}
}
