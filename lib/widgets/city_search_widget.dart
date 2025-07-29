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
            const Text(
              'Weather',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 60),
            TextField(
              controller: cityController,
              enabled: !isLoading,
              cursorColor: Colors.black87,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              onSubmitted: (_) => onGetWeather(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 48,
              child: isLoading
                  ? const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.black87,
                          ),
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: onGetWeather,
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Get Weather',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.0,
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
