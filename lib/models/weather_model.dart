class WeatherModel {
  final String city;
  final String description;
  final String imageUrl;
  final double windSpeed;
  final double rain;
  final int humidity;
  final double temperature;

  WeatherModel({
    required this.city,
    required this.description,
    required this.imageUrl,
    required this.windSpeed,
    required this.rain,
    required this.humidity,
    required this.temperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      description: json['weather'][0]['description'],
      imageUrl:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png',
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      rain: json['rain'] != null
          ? (json['rain']['1h'] as num?)?.toDouble() ?? 0.0
          : 0.0,
      humidity: json['main']['humidity'],
      temperature: (json['main']['temp'] as num).toDouble(),
    );
  }
}
