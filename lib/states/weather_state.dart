import 'package:flutter_app/models/weather_model.dart';

abstract class WeatherState {}

// class WeatherInitial extends WeatherState {} //no need for this app

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}

class WeatherError extends WeatherState {
  final String errorMessage;

  WeatherError({required this.errorMessage});
}
