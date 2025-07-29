import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../models/forecast_model.dart';
import '../constants/app_styles.dart';
import '../utils/weather_utils.dart';
import '../widgets/weather_info_card.dart';

class DailyForecastPage extends StatelessWidget {
  final List<ForecastItem> forecasts;

  const DailyForecastPage({super.key, required this.forecasts});

  // grouping forecasts by day and extract daily data (starting from tomorrow)
  Map<String, DailyForecast> _groupForecastsByDay() {
    Map<String, List<ForecastItem>> groupedByDay = {};

    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final tomorrowStart = DateTime(tomorrow.year, tomorrow.month, tomorrow.day);

    for (var forecast in forecasts) {
      // only include forecasts from tomorrow onwards
      if (forecast.dateTime.isBefore(tomorrowStart)) continue;

      String dayKey =
          '${forecast.dateTime.year}-${forecast.dateTime.month}-${forecast.dateTime.day}';
      if (!groupedByDay.containsKey(dayKey)) {
        groupedByDay[dayKey] = [];
      }
      groupedByDay[dayKey]!.add(forecast);
    }

    Map<String, DailyForecast> dailyForecasts = {};

    groupedByDay.forEach((dayKey, dayForecasts) {
      double minTemp = dayForecasts
          .map((f) => f.temperature)
          .reduce((a, b) => a < b ? a : b);
      double maxTemp = dayForecasts
          .map((f) => f.temperature)
          .reduce((a, b) => a > b ? a : b);

      // getting the most frequent weather condition for the day
      Map<String, int> iconCount = {};
      for (var forecast in dayForecasts) {
        iconCount[forecast.iconCode] = (iconCount[forecast.iconCode] ?? 0) + 1;
      }
      String mostCommonIcon = iconCount.entries
          .reduce((a, b) => a.value > b.value ? a : b)
          .key;

      dailyForecasts[dayKey] = DailyForecast(
        date: dayForecasts.first.dateTime,
        minTemperature: minTemp,
        maxTemperature: maxTemp,
        iconCode: mostCommonIcon,
        description: dayForecasts.first.description,
        windSpeed:
            dayForecasts.map((f) => f.windSpeed).reduce((a, b) => a + b) /
            dayForecasts.length,
        rain: dayForecasts.map((f) => f.rain).reduce((a, b) => a + b),
        humidity:
            (dayForecasts.map((f) => f.humidity).reduce((a, b) => a + b) /
                    dayForecasts.length)
                .round(),
      );
    });

    return dailyForecasts;
  }

  @override
  Widget build(BuildContext context) {
    final dailyForecasts = _groupForecastsByDay();
    final sortedDays = dailyForecasts.keys.toList()..sort();

    if (sortedDays.isEmpty) {
      return Scaffold(
        backgroundColor: AppStyles.backgroundColor,
        appBar: AppBar(
          title: const Text('5 days'),
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
        body: const Center(child: Text('No forecast data available')),
      );
    }

    final tomorrowKey = sortedDays.first;
    final tomorrowForecast = dailyForecasts[tomorrowKey]!;
    final remainingDays = sortedDays.skip(1).toList();

    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        title: const Text('5 days'),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Lottie.asset(
                    WeatherUtils.getWeatherAnimation(tomorrowForecast.iconCode),
                    width: 160,
                    height: 160,
                    fit: BoxFit.contain,
                    repeat: false,
                  ),
                  const SizedBox(width: 30),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tomorrow',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              WeatherUtils.formatTemperature(
                                tomorrowForecast.maxTemperature,
                              ),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const Text(
                              ' / ',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black54,
                              ),
                            ),
                            Text(
                              WeatherUtils.formatTemperature(
                                tomorrowForecast.minTemperature,
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          tomorrowForecast.description,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: WeatherInfoCard(
                      label: 'Wind',
                      value: WeatherUtils.convertWindSpeed(
                        tomorrowForecast.windSpeed,
                      ),
                      icon: Icons.air,
                    ),
                  ),
                  Flexible(
                    child: WeatherInfoCard(
                      label: 'Humidity',
                      value: WeatherUtils.formatPercentage(
                        tomorrowForecast.humidity.toDouble(),
                      ),
                      icon: Icons.water_drop,
                    ),
                  ),
                  Flexible(
                    child: WeatherInfoCard(
                      label: 'Rain',
                      value: WeatherUtils.formatPercentage(
                        WeatherUtils.convertRainToPercentage(
                          tomorrowForecast.rain,
                        ).toDouble(),
                      ),
                      icon: Icons.umbrella,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ...remainingDays.map((dayKey) {
              final dailyForecast = dailyForecasts[dayKey]!;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
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
                    Expanded(
                      flex: 1,
                      child: Lottie.asset(
                        WeatherUtils.getWeatherAnimation(
                          dailyForecast.iconCode,
                        ),
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        repeat: false,
                      ),
                    ),
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
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            WeatherUtils.formatTemperature(
                              dailyForecast.maxTemperature,
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            WeatherUtils.formatTemperature(
                              dailyForecast.minTemperature,
                            ),
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
            }),
          ],
        ),
      ),
    );
  }

  String _getDayName(DateTime date) {
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
  final double windSpeed;
  final double rain;
  final int humidity;

  DailyForecast({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.iconCode,
    required this.description,
    required this.windSpeed,
    required this.rain,
    required this.humidity,
  });
}
