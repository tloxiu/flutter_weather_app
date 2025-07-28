import 'package:flutter/material.dart';
import '../models/forecast_model.dart';
import 'forecast_item_widget.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List<ForecastItem> forecasts;

  const HourlyForecastWidget({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Text(
            'Today',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero, // Brak padding - przewijanie do samych krawędzi
            itemCount: forecasts.length > 8 ? 8 : forecasts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 20 : 0, // Tylko pierwszy element ma lewy margin
                  right: 12, // Wszystkie mają prawy margin
                ),
                child: ForecastItemWidget(item: forecasts[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
