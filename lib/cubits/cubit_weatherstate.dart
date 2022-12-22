import 'package:weatherapiapp/model/weathermodel.dart';

class WeatherState {
}
class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}
class WeatherSuccess extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);
}
class WeatherFailure extends WeatherState {}