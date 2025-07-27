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
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: 'Enter city name',
                  labelStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      isLoading ? AppStyles.buttonBorderRadius : AppStyles.inputBorderRadius,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppStyles.inputBorderRadius),
                    borderSide: const BorderSide(color: Colors.black, width: 2.0),
                  ),
                  filled: true,
                  fillColor: isLoading ? Colors.grey[100] : AppStyles.backgroundColor,
                ),
                onSubmitted: (_) => onGetWeather(),
                textAlign: TextAlign.start,
                style: AppStyles.inputStyle,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50, // Stała wysokość dla przycisku/indicatora
              child: AnimatedSwitcher(
                duration: AppStyles.switcherAnimationDuration,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppStyles.primaryColor),
                        ),
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
                        child: const Center(
                          child: Text(
                            'Check Weather',
                            style: AppStyles.buttonStyle,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
