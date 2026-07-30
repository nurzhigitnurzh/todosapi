import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson6todo/bloc/city_bloc.dart';
import 'package:lesson6todo/bloc/city_state.dart';
import 'package:lesson6todo/models/city_model.dart';
import 'package:lesson6todo/weather_page.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  final CityBloc _cityBloc = CityBloc();

  @override
  void initState() {
    _cityBloc.add(SearchCityEvent(searchCity: 'Bish'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (String value) {
                _cityBloc.add(SearchCityEvent(searchCity: value));
              },
            ),
            Expanded(
              child: BlocBuilder<CityBloc, CityState>(
                bloc: _cityBloc,
                builder: (BuildContext context, CityState state) {
                  if (state is ErrorCityState) {
                    return const Center(child: Text("Error"));
                  }
                  if (state is SearchCityState) {
                    return ListView.builder(
                      itemCount: state.listCity.length,
                      itemBuilder: (BuildContext context, int index) {
                        final CityModel city = state.listCity[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (context) => WeatherPage(
                                  lat: city.lat,
                                  lon: city.lon,
                                 ),
                               ),
                             );
                          },
                          title: Text(city.name),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}