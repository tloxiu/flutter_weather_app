import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/forecast_model.dart';

class ForecastService {
  static const String _apiKey = '5eb97d2e3cd6d388aa6a85ce85979b1d';
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  static Future<ForecastModel?> getForecast(String city) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric&lang=en',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ForecastModel.fromJson(data);
      } else {
        print('Forecast API Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Forecast API Exception: $e');
      return null;
    }
  }
}
