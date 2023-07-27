/// Domain model for weather data returned from the openweathermap API
class Weather {
  final double temp;
  final double humidity;
  final double wind;
  final String desc;

  const Weather(
      {required this.temp,
      required this.desc,
      required this.humidity,
      required this.wind});

  /// Factory method used to convert the HTTP response body from openweathermap API to our weather domain model
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        desc: json['weather'][0]['description'].toString());
  }
}
