class Weathermodel {
  final String cityname;
  final double temp;
  final double maxtemp;
  final double mintemp;

  final int humidity;
  final double wind;

  final String weathercondition;

  Weathermodel({
    required this.humidity,
    required this.wind,
    required this.cityname,
    required this.temp,
    required this.maxtemp,
    required this.mintemp,
    required this.weathercondition,
  });

  factory Weathermodel.fromJson(json) {
    return Weathermodel(
      cityname: json['location']['name'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxtemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      mintemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weathercondition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      humidity: json['forecast']['forecastday'][0]['day']['avghumidity'],
      wind: json['forecast']['forecastday'][0]['day']['maxwind_kph'],
    );
  }

  factory Weathermodel.empty() {
    return Weathermodel(
      cityname: '',
      temp: 0.0,
      maxtemp: 0.0,
      mintemp: 0.0,
      humidity: 0,
      wind: 0.0,
      weathercondition: '',
    );
  }
}
