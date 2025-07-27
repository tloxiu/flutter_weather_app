/// class with utils
class WeatherUtils {
  WeatherUtils._();

  // converting wind speed from m/s to km/h
  static String convertWindSpeed(double windSpeedMs) {
    final windSpeedKmh = windSpeedMs * 3.6;
    return '${windSpeedKmh.toStringAsFixed(1)} km/h';
  }

  // converting temperature to display format
  static String formatTemperature(double temperature) {
    return '${temperature.round()}°';
  }

  // formating percentage for display
  static String formatPercentage(double percentage) {
    return '${percentage.round()}%';
  }

  /// checking if the city name is not empty or whitespace
  static bool isValidCityName(String cityName) {
    return cityName.trim().isNotEmpty;
  }

  /// converting rain amount (mm) to percentage
  static int convertRainToPercentage(double rainMm) {
    if (rainMm <= 0) return 0;
    if (rainMm >= 10) return 100;
    return (rainMm * 10).round();
  }
}
