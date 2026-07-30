class WeatherModel {
  WeatherModel({
    required this.longitude, 
    required this.latitude, 
    required this.temperature,
    required this.currentWeather});


  final double longitude;
  final double latitude;
  final String temperature;
  final CurrentWeather currentWeather;

  factory WeatherModel.fromJson(Map<String,dynamic>json){
    return WeatherModel(
      longitude: json['longitude'], 
      latitude: json['latitude'], 
      temperature: json['current_weather_units']['temperature'],
      currentWeather: CurrentWeather.fromJson(json['current_weather']
      )
    );
  }
}

final class CurrentWeather{
  CurrentWeather({required this.temperature});

  final double temperature;
  factory CurrentWeather.fromJson(Map<String, dynamic> json){
    return CurrentWeather(temperature: json['temperature']);
  }
}