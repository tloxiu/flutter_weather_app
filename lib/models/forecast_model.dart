class ForecastItem {
  final DateTime dateTime;
  final double temperature;
  final String iconCode;
  final String description;
  final double windSpeed;
  final double rain;
  final int humidity;

  ForecastItem({
    required this.dateTime,
    required this.temperature,
    required this.iconCode,
    required this.description,
    required this.windSpeed,
    required this.rain,
    required this.humidity,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: (json['main']['temp'] as num).toDouble(),
      iconCode: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
      windSpeed: json['wind'] != null 
          ? (json['wind']['speed'] as num?)?.toDouble() ?? 0.0
          : 0.0,
      rain: json['rain'] != null
          ? (json['rain']['3h'] as num?)?.toDouble() ?? 0.0
          : 0.0,
      humidity: json['main']['humidity'] ?? 0,
    );
  }
}

class ForecastModel {
  final List<ForecastItem> items;

  ForecastModel({required this.items});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> list = json['list'];
    final items = list.map((item) => ForecastItem.fromJson(item)).toList();
    
    return ForecastModel(items: items);
  }
}
