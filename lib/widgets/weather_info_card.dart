import 'package:flutter/material.dart';
import '../constants/app_styles.dart';

/// info card widget
class WeatherInfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const WeatherInfoCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppStyles.weatherInfoWidth,
      height: AppStyles.weatherInfoHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppStyles.primaryColor.withValues(alpha: 0.7),
            size: AppStyles.weatherIconSize,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppStyles.labelStyle.copyWith(color: Colors.black54),
          ),
          Text(
            value,
            style: AppStyles.valueStyle.copyWith(color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
