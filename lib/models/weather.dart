class Weather {
  final String temp;
  final String desc;
  final String humidity;

  const Weather(
      {required this.temp, required this.desc, required this.humidity});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        temp: json['main']['temp'].toString(),
        desc: json['weather'][0]['description'],
        humidity: json['main']['humidity'].toString());
  }
}
