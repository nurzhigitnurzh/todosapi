import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:lesson6todo/models/city_model.dart';
import 'package:lesson6todo/repository/weather_repository.dart';
import 'package:lesson6todo/bloc/city_state.dart';
part 'city_event.dart';


class CityBloc extends Bloc<CityEvent,CityState>{
  final WeatherRepository repository = WeatherRepository();


  CityBloc() : super(CityInitial()){
    on<SearchCityEvent>(_getCities);
    on<GetWeatherEvent>(_getWeather);
  }
  Future<void> _getCities
    (SearchCityEvent event, emit)async{
      try{
        emit(LoadingCityState());
          final city = await repository.searchCity(event.searchCity);
        emit(SearchCityState(listCity: city));
      
      }catch(e){
      
        emit(ErrorCityState());
      }
    }
    Future<void> _getWeather(
      GetWeatherEvent event,
      Emitter<CityState>emit)
      async{
        try{
        emit(LoadingCityState());
        final weather = await repository.getWeather(event.lon, event.lat);
        emit(GetWeatherState(weatherModel: weather));
        } catch(e){
          print(e);
          emit(ErrorCityState());
        }

      }
  }
