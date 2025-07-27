import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../constants/app_styles.dart';
import '../utils/weather_utils.dart';
import 'weather_info_card.dart';

/// info widget displaying weather data
class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplay({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyles.contentPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                value: WeatherUtils.formatPercentage(weather.humidity.toDouble()),
                icon: Icons.water_drop,
              ),
              WeatherInfoCard(
                label: 'Rain',
                value: WeatherUtils.formatPercentage(
                  WeatherUtils.convertRainToPercentage(weather.rain).toDouble()
                ),
                icon: Icons.umbrella,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
