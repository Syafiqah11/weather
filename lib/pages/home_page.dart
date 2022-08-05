// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/weather_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      setState((() => _isCityNameEmpty = _controller.text.isEmpty));
    });
    //Or directly write as one line
    // _controller.addListener(() => isCityNameEmpty = _controller.text.isEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search City')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Please enter city name: ',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'City Name',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: _isCityNameEmpty
                  ? null
                  : (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeatherDetail(
                                    cityName: _controller.text,
                                  )));
                    }),
              child: const Text('Search'))
        ],
      )),
    );
  }
}
