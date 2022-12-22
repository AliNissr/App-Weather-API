import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapiapp/model/weathermodel.dart';
import '../services/weather_services_view.dart';
import 'cubit_weatherstate.dart';

class WeatherCubit  extends Cubit<WeatherState>{
  WeatherCubit(this.weatherservices) : super (WeatherInitial());
  MyWeatherServices weatherservices;
  WeatherModel? weathermodel;
  String? CityName;
  void getweather  ({required String CityName}) async{
    emit(WeatherLoading());
   try {
    weathermodel = await weatherservices.gitweather(CityName: CityName);
     emit(WeatherSuccess(weathermodel!));
   } on Exception catch (e) {
     print ('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$e');
     emit(WeatherFailure());
   }

  }
}