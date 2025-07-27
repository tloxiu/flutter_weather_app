import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';
import '../widgets/city_search_widget.dart';
import '../widgets/weather_display.dart';
import '../widgets/weather_app_bar.dart';
import '../constants/app_styles.dart';
import '../utils/weather_utils.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage>
    with TickerProviderStateMixin {
  final TextEditingController _cityController = TextEditingController();
  final WeatherService _weatherService = WeatherService();
  WeatherModel? _weather;
  bool _isLoading = false;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: AppStyles.fadeAnimationDuration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _getWeather() async {
    if (!WeatherUtils.isValidCityName(_cityController.text)) return;

    setState(() {
      _isLoading = true;
    });

    final weather = await _weatherService.getWeatherByCity(
      _cityController.text,
    );

    if (weather != null) {
      await _fadeController.reverse();

      setState(() {
        _weather = weather;
        _isLoading = false;
      });

      await _fadeController.forward();
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _backToSearch() async {
    await _fadeController.reverse();

    setState(() {
      _weather = null;
      _cityController.clear();
    });

    await _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _weather != null
          ? WeatherAppBar(
              cityName: _weather!.city,
              fadeAnimation: _fadeAnimation,
              onBackToSearch: _backToSearch,
            )
          : null,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _weather == null 
            ? CitySearchWidget(
                cityController: _cityController,
                isLoading: _isLoading,
                onGetWeather: _getWeather,
              )
            : WeatherDisplay(weather: _weather!),
      ),
    );
  }
}
