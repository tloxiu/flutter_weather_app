import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/weather_model.dart';
import '../models/forecast_model.dart';
import '../constants/app_styles.dart';
import '../utils/weather_utils.dart';
import 'weather_info_card.dart';
import 'hourly_forecast_widget.dart';

/// info widget for displaying current weather and forecasts
class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;
  final List<ForecastItem>? forecasts;

  const WeatherDisplay({super.key, required this.weather, this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: AppStyles.contentPadding,
          child: Column(
            children: [
              Lottie.asset(
                WeatherUtils.getWeatherAnimation(weather.iconCode),
                width: 230,
                height: 230,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              Text(
                WeatherUtils.formatTemperature(weather.temperature),
                style: AppStyles.temperatureStyle,
              ),
              Text(
                weather.description,
                style: AppStyles.descriptionStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WeatherInfoCard(
                    label: 'Wind',
                    value: WeatherUtils.convertWindSpeed(weather.windSpeed),
                    icon: Icons.air,
                  ),
                  WeatherInfoCard(
                    label: 'Humidity',
                    value: WeatherUtils.formatPercentage(
                      weather.humidity.toDouble(),
                    ),
                    icon: Icons.water_drop,
                  ),
                  WeatherInfoCard(
                    label: 'Rain',
                    value: WeatherUtils.formatPercentage(
                      WeatherUtils.convertRainToPercentage(
                        weather.rain,
                      ).toDouble(),
                    ),
                    icon: Icons.umbrella,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (forecasts != null && forecasts!.isNotEmpty) ...[
          const SizedBox(height: 30),
          HourlyForecastWidget(forecasts: forecasts!),
        ],
      ],
    );
  }
}
