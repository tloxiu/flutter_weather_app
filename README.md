# Weather App 🌤️

A modern, responsive Flutter weather application with elegant animations and clean architecture.

## ✨ Features

- **Real-time Weather Data**: Integration with OpenWeatherMap API
- **Smooth Animations**: Fade transitions between screens  
- **Responsive Design**: Optimized for different screen sizes
- **Clean Architecture**: Well-organized code structure with separation of concerns
- **Modern UI**: Material Design with custom styling and shadows
- **Professional Code**: Comprehensive documentation and best practices

## 📱 Screenshots

### Search Screen
- Clean, minimalist design with weather app branding
- Animated search field with validation
- Loading states with smooth transitions

### Weather Details Screen  
- Large temperature display
- Weather description
- Wind speed (km/h), humidity (%), and rain percentage
- Custom styled information cards with shadows
- AppBar with location indicator and search functionality

## 🏗️ Architecture

```
lib/
├── constants/          # App-wide constants and styling
│   └── app_styles.dart # Colors, fonts, dimensions, shadows
├── model/              # Data models
│   └── weather_model.dart
├── pages/              # Screen/page widgets
│   └── weather_page.dart
├── services/           # External API services
│   └── weather_service.dart
├── utils/              # Helper functions and utilities
│   └── weather_utils.dart
├── widgets/            # Reusable UI components
│   ├── city_search_widget.dart    # Search form component
│   ├── weather_app_bar.dart       # Custom app bar
│   ├── weather_display.dart       # Weather details view
│   └── weather_info_card.dart     # Individual info cards
└── main.dart          # App entry point
```

## 🎨 Design Features

- **Consistent Styling**: Centralized theme management in `AppStyles`
- **Smooth Animations**: 800ms fade transitions with easing curves
- **Shadow Effects**: Elevated cards with subtle shadows
- **Responsive Layout**: Adaptive design elements
- **Material Design**: Following Flutter's design guidelines

## 🔧 Technical Implementation

### State Management
- **StatefulWidget** with local state management
- **AnimationController** for smooth screen transitions
- **TextEditingController** for form input handling

### API Integration
- **HTTP requests** to OpenWeatherMap API
- **JSON parsing** with custom model classes
- **Error handling** for network failures
- **English language** support for weather descriptions

### Code Quality
- **Separation of concerns** with dedicated folders
- **Reusable components** for maintainability
- **Type safety** with Dart's strong typing
- **Documentation** with comprehensive comments
- **Constants management** for easy theming

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- OpenWeatherMap API key

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/flutter-weather-app.git
   cd flutter-weather-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API key**
   - Get your free API key from [OpenWeatherMap](https://openweathermap.org/api)
   - Add your API key to `lib/services/weather_service.dart`
   ```dart
   static const String apiKey = 'YOUR_API_KEY_HERE';
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0         # HTTP requests for API calls
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
```

## 🌟 Key Components

### WeatherModel
- Temperature, description, city name
- Wind speed, humidity, rain data
- JSON serialization support

### WeatherService
- OpenWeatherMap API integration
- City-based weather searches
- Error handling and response validation
- English language responses

### WeatherUtils
- Unit conversion functions (m/s to km/h)
- Rain amount to percentage conversion
- Temperature and percentage formatting
- Input validation helpers

### AppStyles
- Centralized styling system
- Color palette management
- Typography definitions
- Animation duration constants
- Shadow and border radius settings

## 🎯 Current Version Features

- [x] City weather search
- [x] Real-time weather data
- [x] Smooth fade animations
- [x] Responsive design
- [x] Error handling
- [x] Clean architecture
- [x] Professional code structure
- [x] Unit conversions (wind speed, rain percentage)
- [x] Centralized styling and utilities

## 🚧 Planned Enhancements

- [ ] 5-day weather forecast
- [ ] Geolocation support
- [ ] Favorite cities list
- [ ] Dark/light theme toggle
- [ ] Weather notifications
- [ ] Offline caching
- [ ] Unit preferences (°C/°F)
- [ ] Multiple language support

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👏 Acknowledgments

- [OpenWeatherMap](https://openweathermap.org/) for weather data API
- [Flutter](https://flutter.dev/) for the amazing framework
- [Material Design](https://material.io/) for design guidelines

---

**Version**: 1.0.0  
**Flutter**: 3.x  
**Dart**: 3.x  

Made with ❤️ and Flutter
