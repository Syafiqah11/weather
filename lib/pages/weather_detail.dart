// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/states/weather_cubit.dart';
import 'package:flutter_app/states/weather_state.dart';
import 'package:flutter_app/widgets/weather_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDetail extends StatelessWidget {
  const WeatherDetail({required this.cityName, Key? key}) : super(key: key);

  final String cityName;

  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of<WeatherCubit>(context)
      ..fetchWeather(cityName);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Detail'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: BlocProvider.of<WeatherCubit>(context),
          builder: ((context, state) {
            if (state is WeatherLoading) {
              return const CircularProgressIndicator();
            }
            if (state is WeatherLoaded) {
              return WeatherInformation(weatherModel: state.weatherModel);
            }

            return Text(
                state is WeatherError ? state.errorMessage : 'Unknown error.');
          }),
        ),
      ),
    );
  }
}
