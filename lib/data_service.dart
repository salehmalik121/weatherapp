import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/model.dart';

class Dataservice {
  Future<getdata> getWeather(String city) async {
    //api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
    final queryperameters = {
      'q': city,
      'units': 'metric',
      'appid': '904ee5325feea1448a8a926b0532e289',
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryperameters);
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return getdata.fromJson(json);
  }
}
