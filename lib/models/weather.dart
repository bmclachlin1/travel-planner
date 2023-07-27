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

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['main']['temp'],
        humidity: json['main']['humidity'],
        wind: json['wind']['speed'],
        desc: json['weather'][0]['description'].toString());
  }
}
