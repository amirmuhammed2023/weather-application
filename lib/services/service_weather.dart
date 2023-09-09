import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/model_weather.dart';
class serviceweather{
 Future<modelweather?> getweather({required String cityname}) async{
  modelweather? model ;
   try {
     String fixedurl = "http://api.weatherapi.com/v1" ;
   String fixedapi = "b4ed5835784548fe9c4125154232106";
   Uri url = Uri.parse("$fixedurl/forecast.json?key=b4ed5835784548fe9c4125154232106&q=$cityname&days=3"); 
   http.Response response = await http.get(url);
   Map<String,dynamic> data = jsonDecode(response.body) ;
    model = modelweather.fromjson(data) ;
   
   } catch (e) {
     print(e) ;
   }

   return model ; 
   
  }
}