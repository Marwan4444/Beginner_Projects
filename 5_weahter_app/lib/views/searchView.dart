import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';

class Searchview extends StatelessWidget {
  const Searchview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradientTheme = Theme.of(context).extension<GradientTheme>()!;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Search City",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: gradientTheme.backgroundGradient,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                
                const Icon(
                  Icons.cloud_outlined,
                  size: 80,
                  color: Colors.white70,
                ),
                const SizedBox(height: 20),

                // 📝 Title
                const Text(
                  "What's the weather like?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),

                // 🔍 TextField مع Glass Effect
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white30,
                          width: 1.5,
                        ),
                      ),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        onSubmitted: (value) async {
                          var getWeatherCubit =
                              BlocProvider.of<GetWeatherCubit>(context);
                          getWeatherCubit.getWeather(cityName: value);
                          Navigator.pop(context);
                        },
                        decoration: const InputDecoration(
                          hintText: "Enter city name",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                // 🎯 Search Button عصري
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    backgroundColor: Colors.white.withOpacity(0.2),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                    elevation: 6,
                  ),
                  onPressed: () {
                   
                  },
                  child: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
