import 'package:flutter/material.dart';
import '../models/forecast_model.dart';
import '../constants/app_styles.dart';
import '../utils/weather_utils.dart';

class DailyForecastPage extends StatelessWidget {
  final List<ForecastItem> forecasts;

  const DailyForecastPage({
    super.key,
    required this.forecasts,
  });

  // Group forecasts by day and extract daily data
  Map<String, DailyForecast> _groupForecastsByDay() {
    Map<String, List<ForecastItem>> groupedByDay = {};
    
    for (var forecast in forecasts) {
      String dayKey = '${forecast.dateTime.year}-${forecast.dateTime.month}-${forecast.dateTime.day}';
      if (!groupedByDay.containsKey(dayKey)) {
        groupedByDay[dayKey] = [];
      }
      groupedByDay[dayKey]!.add(forecast);
    }

    Map<String, DailyForecast> dailyForecasts = {};
    
    groupedByDay.forEach((dayKey, dayForecasts) {
      double minTemp = dayForecasts.map((f) => f.temperature).reduce((a, b) => a < b ? a : b);
      double maxTemp = dayForecasts.map((f) => f.temperature).reduce((a, b) => a > b ? a : b);
      
      // Get the most frequent weather condition for the day
      Map<String, int> iconCount = {};
      for (var forecast in dayForecasts) {
        iconCount[forecast.iconCode] = (iconCount[forecast.iconCode] ?? 0) + 1;
      }
      String mostCommonIcon = iconCount.entries.reduce((a, b) => a.value > b.value ? a : b).key;
      
      dailyForecasts[dayKey] = DailyForecast(
        date: dayForecasts.first.dateTime,
        minTemperature: minTemp,
        maxTemperature: maxTemp,
        iconCode: mostCommonIcon,
        description: dayForecasts.first.description,
      );
    });

    return dailyForecasts;
  }

  @override
  Widget build(BuildContext context) {
    final dailyForecasts = _groupForecastsByDay();
    final sortedDays = dailyForecasts.keys.toList()..sort();

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Text('5-Day Forecast'),
        backgroundColor: AppStyles.backgroundColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: sortedDays.length > 5 ? 5 : sortedDays.length,
        itemBuilder: (context, index) {
          final dayKey = sortedDays[index];
          final dailyForecast = dailyForecasts[dayKey]!;
          
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Day name
                Expanded(
                  flex: 2,
                  child: Text(
                    _getDayName(dailyForecast.date),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Weather icon
                Expanded(
                  flex: 1,
                  child: Image.network(
                    'https://openweathermap.org/img/wn/${dailyForecast.iconCode}@2x.png',
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) => 
                      const Icon(Icons.wb_sunny, size: 50, color: Colors.orange),
                  ),
                ),
                // Description
                Expanded(
                  flex: 2,
                  child: Text(
                    dailyForecast.description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Temperature range
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        WeatherUtils.formatTemperature(dailyForecast.maxTemperature),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        WeatherUtils.formatTemperature(dailyForecast.minTemperature),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _getDayName(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final targetDay = DateTime(date.year, date.month, date.day);
    
    final difference = targetDay.difference(today).inDays;
    
    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    
    const dayNames = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return dayNames[date.weekday - 1];
  }
}

class DailyForecast {
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final String iconCode;
  final String description;

  DailyForecast({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.iconCode,
    required this.description,
  });
}
