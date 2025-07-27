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
    return Container(
      width: AppStyles.weatherInfoWidth,
      height: AppStyles.weatherInfoHeight,
      decoration: BoxDecoration(
        color: AppStyles.backgroundColor,
        borderRadius: BorderRadius.circular(AppStyles.cardBorderRadius),
        boxShadow: AppStyles.cardShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppStyles.primaryColor,
            size: AppStyles.weatherIconSize,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppStyles.labelStyle,
          ),
          Text(
            value,
            style: AppStyles.valueStyle,
          ),
        ],
      ),
    );
  }
}
