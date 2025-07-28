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

  /// mapping api icons to lottie animations
  static String getWeatherAnimation(String apiIconCode) {
    switch (apiIconCode) {
      // clear sky
      case '01d':
        return 'assets/clear_day.json';
      case '01n':
        return 'assets/clear_night.json';
      
      // few clouds
      case '02d': 
        return 'assets/few_clouds_day.json';
      case '02n': 
        return 'assets/few_clouds_night.json';
      
      // scattered clouds
      case '03d':
      case '03n':
        return 'assets/scattered_clouds.json';
      
      // broken clouds
      case '04d':
      case '04n':
        return 'assets/broken_clouds.json';
      
      // shower rain
      case '09d':
        return 'assets/shower_rain.json';
      case '09n':
        return 'assets/shower_rain_night.json';
      
      // rain
      case '10d':
        return 'assets/rain_day.json';
      case '10n':
        return 'assets/rain_night.json';
      
      // thunderstorm
      case '11d':
      case '11n':
        return 'assets/thunderstorm.json';
      
      // snow
      case '13d':
      case '13n':
        return 'assets/snow.json';
      
      // mist
      case '50d':
      case '50n':
        return 'assets/mist.json';
      
      // default fallback
      default:
        return 'assets/clear_day.json';
    }
  }
}
