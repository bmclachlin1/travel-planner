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
  group('getNextKDaysWeatherData', () {
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
              'https://api.openweathermap.org/data/2.5/forecast?lat=51&lon=-114.07&appid=${Secrets.openWeatherMapApiKey}&units=metric&cnt=8.0')))
          .thenAnswer((_) async => http.Response("""
  {
    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
        {
            "dt": 1690750800,
            "main": {
                "temp": 30.01,
                "feels_like": 28.69,
                "temp_min": 30.01,
                "temp_max": 31.71,
                "pressure": 1009,
                "sea_level": 1009,
                "grnd_level": 896,
                "humidity": 29.0,
                "temp_kf": -1.7
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": {
                "all": 20
            },
            "wind": {
                "speed": 5.3,
                "deg": 242,
                "gust": 8.98
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2023-07-30 21:00:00"
        }
]}""", 200));

      expect(
          await OpenWeatherMapService.getNextKDaysWeatherData(city, client, 1),
          isA<List<WeatherModel>>());
    });

    test('throws error on bad request', () async {
      when(client.get(Uri.parse(
              'https://api.openweathermap.org/data/2.5/forecast?lat=51&lon=-114.07&appid=${Secrets.openWeatherMapApiKey}&units=metric&cnt=8.0')))
          .thenAnswer((_) async => http.Response(
              '{"cod": "400","message": "Nothing to geocode"}', 400));

      expect(OpenWeatherMapService.getNextKDaysWeatherData(city, client, 1),
          throwsException);
    });
  });
}
