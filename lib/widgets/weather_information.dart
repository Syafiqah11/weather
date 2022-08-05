// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/models/weather_model.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({required this.weatherModel, Key? key})
      : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[600],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Image(
                image: NetworkImage(
                    'http://openweathermap.org/img/wn/${weatherModel.weather.first.icon}.png',
                    scale: 0.4),
                // color: Colors.amber,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weatherModel.main.temp} °C',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Feels like ${weatherModel.main.feelsLike} °C',
                      // style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text('${weatherModel.name}'),
                    SizedBox(height: 10),
                    Text('${weatherModel.weather.first.description}'),
                  ],
                ),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'humidity (${weatherModel.main.humidity} °C)',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.water,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'sea level (${weatherModel.main.seaLevel})',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.upload_sharp,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ground level (${weatherModel.main.grndLevel})',
                      // style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
