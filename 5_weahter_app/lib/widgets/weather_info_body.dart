import 'package:flutter/material.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_card.dart';

class WeatherInfoBody extends StatelessWidget {
  final Weathermodel weathermodel;

  const WeatherInfoBody({Key? key, required this.weathermodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradientTheme = Theme.of(context).extension<GradientTheme>()!;

    return Container(
      decoration: BoxDecoration(
        gradient: gradientTheme.backgroundGradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    weathermodel.cityname,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    weathermodel.weathercondition,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${weathermodel.temp}°C',
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  WeatherCard(
                      "🔥 Max Temp", "${weathermodel.maxtemp.round()}°C"),
                  WeatherCard(
                      "❄️ Min Temp", "${weathermodel.mintemp.round()}°C"),
                  WeatherCard(" 🌬 Wind", "${weathermodel.wind.round()} km/h"),
                  WeatherCard(
                      "💧 Humidity", "${weathermodel.humidity.round()}%"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
