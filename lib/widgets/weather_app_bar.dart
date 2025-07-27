import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_styles.dart';

/// appbar widget
class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String cityName;
  final Animation<double> fadeAnimation;
  final VoidCallback onBackToSearch;

  const WeatherAppBar({
    super.key,
    required this.cityName,
    required this.fadeAnimation,
    required this.onBackToSearch,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_on,
              color: Colors.red,
              size: AppStyles.appBarIconSize,
            ),
            const SizedBox(width: 5),
            Text(cityName),
          ],
        ),
        centerTitle: true,
        foregroundColor: AppStyles.textColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        actions: [
          Center(
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: onBackToSearch,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  // standard flutter height 56px
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
 