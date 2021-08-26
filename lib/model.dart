class Windinfo {
  double speed;
  int deg;
  Windinfo({
    required this.speed,
    required this.deg,
  });
  factory Windinfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];
    final deg = json['deg'];
    return Windinfo(deg: deg, speed: speed);
  }
}

class Weatherdescription {
  final String description;
  String icon;
  Weatherdescription({
    required this.icon,
    required this.description,
  });
  factory Weatherdescription.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];
    return Weatherdescription(description: description, icon: icon);
  }
}

class Tempinfo {
  double temp;
  Tempinfo({
    required this.temp,
  });
  factory Tempinfo.fromJson(Map<String, dynamic> json) {
    final temp = json['temp'];
    return Tempinfo(temp: temp);
  }
}

// ignore: camel_case_types
class getdata {
  final Windinfo windinfo;
  final Weatherdescription weatherdescription;
  final Tempinfo tempinfo;
  final String cityName;

  getdata({
    required this.windinfo,
    required this.weatherdescription,
    required this.tempinfo,
    required this.cityName,
  });
  factory getdata.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempinfojson = json['main'];
    final tempinfo = Tempinfo.fromJson(tempinfojson);

    final weatherdescriptionjson = json['weather'][0];
    final weatherdescription =
        Weatherdescription.fromJson(weatherdescriptionjson);

    final windinfojson = json['wind'];
    final windinfo = Windinfo.fromJson(windinfojson);
    return getdata(
      tempinfo: tempinfo,
      cityName: cityName,
      weatherdescription: weatherdescription,
      windinfo: windinfo,
    );
  }
}
