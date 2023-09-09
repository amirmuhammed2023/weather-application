import 'package:flutter/material.dart';
import 'package:weather_app/models/model_weather.dart';

class weatherprovider extends ChangeNotifier {
  modelweather? weatherdataaa ;
  String? City ;

  set weatherdata(modelweather? weather){
     weatherdataaa = weather ;
     notifyListeners();
  }
  
  modelweather? get weatherdata{
    return weatherdataaa ;
  }

}