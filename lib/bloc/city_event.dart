part of 'city_bloc.dart';

@immutable
sealed class CityEvent {}

final class SearchCityEvent extends CityEvent{
  SearchCityEvent({required this.searchCity});

  final String searchCity;
}

final class GetWeatherEvent extends CityEvent{
  GetWeatherEvent({required this.lon, required this.lat});
  final double lon;
  final double lat;
}