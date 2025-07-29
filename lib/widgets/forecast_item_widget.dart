import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/forecast_model.dart';
import '../utils/weather_utils.dart';

/// 3 hours forecast item widget
class ForecastItemWidget extends StatelessWidget {
  final ForecastItem item;

  const ForecastItemWidget({super.key, required this.item});

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            WeatherUtils.formatTemperature(item.temperature),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Lottie.asset(
            WeatherUtils.getWeatherAnimation(item.iconCode),
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            repeat: false,
          ),
          Text(
            _formatTime(item.dateTime),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
