class ForecastItem {
  final DateTime dateTime;
  final double temperature;
  final String iconCode;
  final String description;

  ForecastItem({
    required this.dateTime,
    required this.temperature,
    required this.iconCode,
    required this.description,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: (json['main']['temp'] as num).toDouble(),
      iconCode: json['weather'][0]['icon'],
      description: json['weather'][0]['description'],
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
