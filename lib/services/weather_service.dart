import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/weather_model.dart';

class WeatherService {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '5eb97d2e3cd6d388aa6a85ce85979b1d'; // Replace with your API key

  // getting weather for city
  Future<WeatherModel?> getWeatherByCity(String cityName) async {
    try {
      final url = '$baseUrl/weather?q=$cityName&appid=$apiKey&units=metric&lang=en';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        print('API Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching weather: $e');
      return null;
    }
  }

  // getting weather by coordinates
  Future<WeatherModel?> getWeatherByCoordinates(double lat, double lon) async {
    try {
      final url = '$baseUrl/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric&lang=en';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        print('API Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching weather: $e');
      return null;
    }
  }
}
