import 'package:flutter/material.dart';

class WeatherIconHelper {
  static Icon getWeatherIcon(int id) {
    switch (id) {
      case 200: // Thunderstorm with light rain
      case 201: // Thunderstorm with rain
      case 202: // Thunderstorm with heavy rain
      case 210: // Light thunderstorm
      case 211: // Thunderstorm
      case 212: // Heavy thunderstorm
      case 221: // Ragged thunderstorm
      case 230: // Thunderstorm with light drizzle
      case 231: // Thunderstorm with drizzle
      case 232: // Thunderstorm with heavy drizzle
        return const Icon(Icons.flash_on, color: Colors.grey);
      case 300: // Light drizzle
      case 301: // Drizzle
      case 302: // Heavy drizzle
      case 310: // Light drizzle rain
      case 311: // Drizzle rain
      case 312: // Heavy drizzle rain
      case 313: // Shower rain and drizzle
      case 314: // Heavy shower rain and drizzle
      case 321: // Shower drizzle
        return const Icon(Icons.grain, color: Colors.blue);
      case 500: // Light rain
      case 501: // Moderate rain
      case 502: // Heavy rain
      case 503: // Very heavy rain
      case 504: // Extreme rain
      case 511: // Freezing rain
      case 520: // Light shower rain
      case 521: // Shower rain
      case 522: // Heavy shower rain
      case 531: // Ragged shower rain
        return const Icon(Icons.grain, color: Colors.blue);
      case 600: // Light snow
      case 601: // Snow
      case 602: // Heavy snow
      case 611: // Sleet
      case 612: // Light shower sleet
      case 613: // Shower sleet
      case 615: // Light rain and snow
      case 616: // Rain and snow
      case 620: // Light shower snow
      case 621: // Shower snow
      case 622: // Heavy shower snow
        return const Icon(Icons.ac_unit, color: Colors.blue);
      case 701: // Mist
      case 711: // Smoke
      case 721: // Haze
      case 731: // Dust
      case 741: // Fog
      case 751: // Sand
      case 761: // Dust
      case 762: // Ash
      case 771: // Squall
      case 781: // Tornado
        return const Icon(Icons.cloud_circle, color: Colors.grey);
      case 800: // Clear sky
        return const Icon(Icons.wb_sunny, color: Colors.yellow);
      case 801: // Few clouds
      case 802: // Scattered clouds
      case 803: // Broken clouds
      case 804: // Overcast clouds
        return const Icon(Icons.cloud, color: Colors.grey);
      default:
        return const Icon(Icons.error_outline);
    }
  }
}
