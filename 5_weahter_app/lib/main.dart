import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: const CustomWidget(),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherStates>(
      builder: (context, state) {
        ThemeData theme;

        if (state is WeatherLoadedState) {
          theme = getThemeByCondition(state.weathermodel.weathercondition);
        } else {
          theme = ThemeData.light().copyWith(
            primaryColor: Colors.green,
            scaffoldBackgroundColor: Colors.green.shade50,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            extensions: [
              const GradientTheme(
                backgroundGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 129, 250, 133), Color.fromARGB(255, 9, 209, 2)],
                ),
              ),
            ],
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomeView(),
        );
      },
    );
  }
}


@immutable
class GradientTheme extends ThemeExtension<GradientTheme> {
  final LinearGradient backgroundGradient;

  const GradientTheme({required this.backgroundGradient});

  @override
  GradientTheme copyWith({LinearGradient? backgroundGradient}) {
    return GradientTheme(
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }

  @override
  GradientTheme lerp(ThemeExtension<GradientTheme>? other, double t) {
    if (other is! GradientTheme) return this;
    return GradientTheme(
      backgroundGradient: LinearGradient.lerp(
        backgroundGradient,
        other.backgroundGradient,
        t,
      )!,
    );
  }
}

/// --------------------
/// Function لاختيار الثيم حسب حالة الطقس
/// --------------------
ThemeData getThemeByCondition(String condition) {
  condition = condition.toLowerCase();

  final Map<String, MaterialColor> themeColors = {
    "sunny": Colors.amber,
    "cloudy": Colors.blueGrey,
    "overcast": Colors.blueGrey,
    "rain": Colors.blue,
    "snow": Colors.lightBlue,
    "mist": Colors.teal,
    "fog": Colors.teal,
    "thunder": Colors.deepPurple,
  };

  MaterialColor baseColor = Colors.green; // Default
  themeColors.forEach((key, color) {
    if (condition.contains(key)) {
      baseColor = color;
    }
  });

 
  return ThemeData(
    brightness:  Brightness.light,
    primarySwatch: baseColor,
    scaffoldBackgroundColor: Colors.white, // هنستخدم الجريدينت بدل لون ثابت
    appBarTheme: AppBarTheme(
      backgroundColor: baseColor,
      foregroundColor:  Colors.white ,
      elevation: 6,
      shadowColor: baseColor.shade200,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: baseColor.shade400,
      foregroundColor: Colors.white,
      elevation: 8,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color:  Colors.white,
        fontSize: 18,
        shadows: [
          Shadow(
            color: baseColor.shade200.withOpacity(0.6),
            offset: const Offset(1, 1),
            blurRadius: 4,
          ),
        ],
      ),
    ),
    extensions: [
      GradientTheme(
        backgroundGradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            baseColor.shade300,
            baseColor.shade700,
          ],
        ),
      ),
    ],
  );
}
