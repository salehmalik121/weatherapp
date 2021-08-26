import 'package:flutter/material.dart';
import 'package:weatherapp/data_service.dart';
import 'package:weatherapp/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getdata? _response;
  final _textcontroller = TextEditingController();

  dynamic _dataservices = Dataservice();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('WeatherApp'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _response != null
                  ? Column(
                      children: [
                        Image.network(
                            'https://openweathermap.org/img/wn/${_response!.weatherdescription.icon}@2x.png'),
                        Text(
                          _response!.cityName,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${_response!.tempinfo.temp}°',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(_response!.weatherdescription.description,
                            style: TextStyle(fontSize: 18)),
                      ],
                    )
                  : Container(),
              Container(
                width: 150,
                child: TextField(
                  controller: _textcontroller,
                  decoration: InputDecoration(
                    labelText: 'City',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ElevatedButton(
                  onPressed: getvalue,
                  child: Text('Search'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getvalue() async {
    final response = await _dataservices.getWeather(_textcontroller.text);
    setState(() {
      _response = response;
    });
  }
}
