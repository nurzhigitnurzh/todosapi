import 'package:flutter/foundation.dart';

class CityModel {
  final String licence;
  final String lat;
  final String lon;
  final String name;

  
  CityModel({
    required this.licence,
    required this.lat,
    required this.lon,
    required this.name,

  });
  factory CityModel.fromJson(Map<String, dynamic> json){
    return CityModel(
      licence: json['licence'], 
      lat: json['lat'], 
      lon: json['lon'], 
      name: json['name'],
    );
  }
  
}