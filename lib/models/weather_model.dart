/// Domain model for weather data returned from the openweathermap API
class WeatherModel {
  final double temp;
  final double humidity;
  final double wind;
  final String desc;
  final int dt;

  const WeatherModel(
      {required this.temp,
      required this.desc,
      required this.humidity,
      required this.wind,
      required this.dt});

  /// Factory method used to convert the HTTP response body from the openweathermap API to our weather domain model
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        desc: json['weather'][0]['description'].toString(),
        dt: json['dt']);
  }
}
