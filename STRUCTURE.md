# Weather App - Struktura Projektu

## Przegląd architektury

Aplikacja została zrefaktoryzowana zgodnie z najlepszymi praktykami Flutter/Dart, dzieląc kod na logiczne moduły:

## 📁 Struktura folderów

```
lib/
├── constants/          # Stałe i style aplikacji
│   └── app_styles.dart # Kolory, rozmiary, style tekstów
├── model/              # Modele danych
│   └── weather_model.dart
├── pages/              # Główne ekrany aplikacji
│   └── weather_page.dart
├── services/           # Logika biznesowa i API
│   └── weather_service.dart
├── utils/              # Funkcje pomocnicze
│   └── weather_utils.dart
├── widgets/            # Komponenty UI wielokrotnego użytku
│   ├── city_search_widget.dart
│   ├── weather_app_bar.dart
│   ├── weather_display.dart
│   └── weather_info_card.dart
└── main.dart           # Punkt wejścia aplikacji
```

## 🧩 Opis komponentów

### Constants (`constants/`)
- **app_styles.dart**: Centralne miejsce dla wszystkich stylów, kolorów, rozmiarów i animacji

### Model (`model/`)
- **weather_model.dart**: Model danych pogodowych z metodami konwersji

### Pages (`pages/`)
- **weather_page.dart**: Główny kontroler strony - zarządza stanem i logiką nawigacji

### Services (`services/`)
- **weather_service.dart**: Komunikacja z API OpenWeatherMap

### Utils (`utils/`)
- **weather_utils.dart**: Funkcje pomocnicze do formatowania i walidacji

### Widgets (`widgets/`)
- **city_search_widget.dart**: Komponent wyszukiwania miasta
- **weather_app_bar.dart**: Niestandardowy AppBar z animacjami
- **weather_display.dart**: Wyświetlanie szczegółów pogody
- **weather_info_card.dart**: Pojedyncza karta z informacją pogodową

## 🎯 Korzyści z refaktoryzacji

1. **Separacja odpowiedzialności**: Każdy komponent ma jasno określoną rolę
2. **Reużywalność**: Widgety można łatwo używać w innych miejscach
3. **Łatwość testowania**: Komponenty są izolowane i testowalne
4. **Łatwość utrzymania**: Zmiany w stylach wymagają edycji tylko jednego pliku
5. **Czytelność kodu**: Mniejsze pliki, lepiej zorganizowany kod
6. **Skalowalność**: Łatwe dodawanie nowych funkcji

## 🛠️ Jak dodać nowy komponent

1. Utwórz nowy plik w odpowiednim folderze
2. Dodaj import w `weather_page.dart` lub innym komponencie
3. Dodaj nowe style do `app_styles.dart` jeśli potrzebne
4. Dodaj funkcje pomocnicze do `weather_utils.dart` jeśli potrzebne

## 📱 Uruchamianie

```bash
flutter run
```

## 🧪 Testowanie

```bash
flutter test
flutter analyze
```
