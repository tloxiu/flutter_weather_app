import 'package:flutter/material.dart';
import '../constants/app_styles.dart';

/// searching city widget
class CitySearchWidget extends StatelessWidget {
  final TextEditingController cityController;
  final bool isLoading;
  final VoidCallback onGetWeather;

  const CitySearchWidget({
    super.key,
    required this.cityController,
    required this.isLoading,
    required this.onGetWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.wb_sunny,
              size: AppStyles.logoIconSize,
              color: AppStyles.accentColor,
            ),
            const SizedBox(height: 30),
            const Text(
              'Weather App',
              style: AppStyles.titleStyle,
            ),
            const SizedBox(height: 50),
            AnimatedContainer(
              duration: AppStyles.containerAnimationDuration,
              curve: Curves.easeInOut,
              child: TextField(
                controller: cityController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      isLoading ? AppStyles.buttonBorderRadius : AppStyles.inputBorderRadius,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.location_city,
                    color: isLoading ? AppStyles.hintColor : AppStyles.primaryColor,
                  ),
                  filled: true,
                  fillColor: isLoading ? Colors.grey[100] : AppStyles.backgroundColor,
                ),
                onSubmitted: (_) => onGetWeather(),
                textAlign: TextAlign.center,
                style: AppStyles.inputStyle,
              ),
            ),
            const SizedBox(height: 30),
            AnimatedSwitcher(
              duration: AppStyles.switcherAnimationDuration,
              child: isLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
                    )
                  : ElevatedButton(
                      onPressed: onGetWeather,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppStyles.primaryColor,
                        foregroundColor: AppStyles.backgroundColor,
                        padding: AppStyles.buttonPadding,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppStyles.buttonBorderRadius),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Check Weather',
                        style: AppStyles.buttonStyle,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
