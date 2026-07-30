  import 'package:dio/dio.dart';
  import 'package:flutter/widgets.dart';
  import 'package:lesson6todo/models/WeatherModel.dart';
  import 'package:lesson6todo/models/city_model.dart';
  import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

  class WeatherRepository {
    final Dio dio = Dio();


    Future<List<CityModel>> searchCity(String city)async{
      dio.interceptors.add(TalkerDioLogger());
      final Response response = await dio.get(
        'https://nominatim.openstreetmap.org/search?q=$city&format=json',
      
      );
      var listResponse = response.data as List;
      List<CityModel> cities = [];
      listResponse.forEach((element){
        cities.add(CityModel.fromJson(element));
      });
      return cities;
    }
    Future<WeatherModel>getWeather(double lon, double lat)async{
      final Response response = await dio.get('https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current_weather=true',
      queryParameters: {
        'latitude':lat,
        'longitude':lon,
        'current_weather':true,
      },
      );
      return WeatherModel.fromJson(response.data);
    }
  }