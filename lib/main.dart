import 'package:flutter/material.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create:(context){
        return weatherprovider() ;
      },
    child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  WeatherApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<weatherprovider>(context).weatherdata== null? Colors.green : Provider.of<weatherprovider>(context).weatherdata!.getcolor() 
      ),
      home: HomePage(),
    );
  }
}