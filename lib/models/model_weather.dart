import 'package:flutter/material.dart';

class modelweather{
  String date;
  double temp;
  double mintemp;
  double maxtemp;
  String weatherstate;

  modelweather({required this.date,required this.maxtemp,required this.mintemp,required this.temp,required this.weatherstate});
  
  factory modelweather.fromjson(dynamic data){
    var jsondata = data["forecast"]["forecastday"][0]["day"] ;
    return modelweather(
      date: data["location"]["localtime"], 
      temp: jsondata["avgtemp_c"],
      maxtemp: jsondata["maxtemp_c"],
      mintemp: jsondata["mintemp_c"],
      weatherstate: jsondata["condition"]["text"]
    ) ;
  }

  String getimage(){
    if(weatherstate == "Snow" || weatherstate == "Showers" ||  weatherstate == "Patchy rain possible"){
      return "assets/images/snow.png" ;
    }
    else if(weatherstate == "Heavy rain" || weatherstate == "Light rain" || weatherstate == "Moderate rain"){
      return "assets/images/rainy.png" ;
    }
    else if(weatherstate == "Heavy cloud" || weatherstate == "Light cloud"){
      return "assets/images/cloudy.png" ;
    }
    else if(weatherstate == "Thunderstorm" || weatherstate == "Hail" || weatherstate == "Sleet"){
      return "assets/images/thunderstorm.png" ;
    }
    else
      return "assets/images/clear.png" ;
  }

  MaterialColor getcolor(){
    if(weatherstate == "Snow" || weatherstate == "Showers" || weatherstate == "Patchy rain possible"){
      return Colors.grey ;
    }
    else if(weatherstate == "Heavy rain" || weatherstate == "Light rain" || weatherstate == "Moderate rain"){
      return Colors.blueGrey ;
    }
    else if(weatherstate == "Heavy cloud" || weatherstate == "Light cloud"){
      return Colors.deepOrange ;
    }
    else if(weatherstate == "Thunderstorm" || weatherstate == "Hail" || weatherstate == "Sleet" || weatherstate == "Sunny"){
      return Colors.amber ;
    }
    else
      return Colors.blue ;
   }
  }
  /*@override
  String toString() {
    return "dat = $date  tem = $temp  maxtem = $maxtemp  mintem = $mintemp  weatherstat = $weatherstate";
  } */
