

  import 'package:lesson6todo/models/city_model.dart';
  import 'package:lesson6todo/models/WeatherModel.dart';

  sealed class CityState {}

  final class CityInitial extends CityState{}
  final class LoadingCityState extends CityState{}
  final class ErrorCityState extends CityState{}

  final class GetWeatherState extends CityState{
    GetWeatherState({required this.weatherModel});

    final WeatherModel weatherModel;
  }

  final class SearchCityState extends CityState{
    SearchCityState({required this.listCity});

    final List<CityModel> listCity;
  }