import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/service_weather.dart';
 class searchpage extends StatefulWidget {
  const searchpage({Key? key}) : super(key: key);

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  String? city ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search a city"),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: TextField(
            onChanged: (data) {
              city = data ;
            },
            onSubmitted:(data)async{
            city = data ;
            serviceweather service = serviceweather(); 
            modelweather? weather =await service.getweather(cityname: city!) ;
            Provider.of<weatherprovider>(context,listen: false).weatherdata = weather ;
             Provider.of<weatherprovider>(context,listen: false).City = city  ;
            Navigator.pop(context) ;
            },
            decoration:InputDecoration(
              contentPadding:EdgeInsets.all(20),
              label:Text("Search"),
              hintText:"Enter a city",
              suffixIcon:GestureDetector(
                onTap: () async{
                  serviceweather service = serviceweather(); 
                  modelweather? weather =await service.getweather(cityname: city!) ;
                  Provider.of<weatherprovider>(context,listen: false).weatherdata = weather ;
                  Provider.of<weatherprovider>(context,listen: false).City = city  ;
                  Navigator.pop(context) ;
                },
                child: Icon(Icons.search)),
              border:OutlineInputBorder()
              ),
          ),
        )
        ),
    );
  }
}