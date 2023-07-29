import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:silvacom_flutter/models/city_model.dart';
import 'package:silvacom_flutter/models/weather_model.dart';
import 'package:silvacom_flutter/secrets.dart';
import 'package:silvacom_flutter/services/open_weather_map_service.dart';
import 'open_weather_map_test.mocks.dart';

@GenerateMocks([http.Client])
void main() async {
  group('getCurrentWeatherData', () {
    late CityModel city;
    late MockClient client;

    setUp(() {
      city = const CityModel(
          documentId: "abc",
          name: "Calgary",
          label: "YYC",
          description: "My hometown",
          latlong: ["51", "-114.07"]);
      client = MockClient();
    });
    test('returns weather data when http call completes successfully',
        () async {
      when(client.get(Uri.parse(
              'https://api.openweathermap.org/data/2.5/weather?lat=51&lon=-114.07&appid=${Secrets.openWeatherMapApiKey}&units=metric')))
          .thenAnswer((_) async => http.Response("""{
    "coord": {
        "lon": 123.1207,
        "lat": 49.2827
    },
    "weather": [
        {
            "id": 803,
            "main": "Clouds",
            "description": "broken clouds",
            "icon": "04d"
        }
    ],
    "base": "stations",
    "main": {
        "temp": 24.18,
        "feels_like": 23.8,
        "temp_min": 24.18,
        "temp_max": 24.18,
        "pressure": 1003,
        "humidity": 44.0,
        "sea_level": 1003,
        "grnd_level": 914
    },
    "visibility": 10000,
    "wind": {
        "speed": 2.6,
        "deg": 289,
        "gust": 4.41
    },
    "clouds": {
        "all": 54
    },
    "dt": 1690596005,
    "sys": {
        "country": "CN",
        "sunrise": 1690575253,
        "sunset": 1690630414
    },
    "timezone": 28800,
    "id": 2035583,
    "name": "Nirji",
    "cod": 200
}""", 200));

      expect(await OpenWeatherMapService.getCurrentWeatherData(city, client),
          isA<WeatherModel>());
    });

    test('throws error on bad request', () async {
      when(client.get(Uri.parse(
              'https://api.openweathermap.org/data/2.5/weather?lat=51&lon=-114.07&appid=${Secrets.openWeatherMapApiKey}&units=metric')))
          .thenAnswer((_) async => http.Response(
              '{"cod": "400","message": "Nothing to geocode"}', 400));

      expect(OpenWeatherMapService.getCurrentWeatherData(city, client),
          throwsException);
    });
  });
}
