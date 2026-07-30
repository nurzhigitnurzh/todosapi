import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson6todo/bloc/city_bloc.dart';
import 'package:lesson6todo/bloc/city_state.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key, required this.lat, required this.lon});
  final String lon;
  final String lat;

  @override
  State<WeatherPage> createState() => _WeatherPageState();

}

class _WeatherPageState extends State<WeatherPage> {
    final CityBloc _cityBloc = CityBloc();
    @override
    void initState(){
        _cityBloc.add(GetWeatherEvent(lon: double.parse(widget.lon), lat: double.parse(widget.lat)));
        super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CityBloc, CityState>(
            bloc: _cityBloc,
          builder: (context, state) {
            if(state is ErrorCityState){
                return Text('flutter 06',style: TextStyle(fontSize: 100, color:Colors.red),
                );
            }
            if (state is GetWeatherState){
                return Text(
                    '${state.weatherModel.currentWeather.temperature}${state.weatherModel.temperature}',
                    style: TextStyle(fontSize: 100),
                );
            }
            return CircularProgressIndicator.adaptive();
          },
        ),
      ),
    );
  
  }

}
