import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/providers/weather_provider.dart';
import '../models/model_weather.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  modelweather? comedata ;
  @override
  Widget build(BuildContext context) {
    comedata = Provider.of<weatherprovider>(context).weatherdata ;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                 return searchpage() ;
              }));
            }, 
            icon:Icon(Icons.search)
            )
        ],
        title: Text('Weather App'),
      ),
      body: comedata == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ) : Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              comedata!.getcolor(),
              comedata!.getcolor()[400]!,
              comedata!.getcolor()[200]!,
              
            ] 
          )
        ),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Text("${Provider.of<weatherprovider>(context).City ?? "Cairo" }" , style:TextStyle(fontWeight:FontWeight.bold,fontSize:35),),
            Text("Updated : ${comedata!.date}",style:TextStyle(fontSize:15),),
            Spacer(),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: [
                Image.asset("${comedata!.getimage()}"),
                Text("${comedata!.temp.toInt()}",style:TextStyle(fontSize:25),),
                Column(children: [
                  Text("Max : ${comedata!.maxtemp.toInt()}"),
                  Text("Min : ${comedata!.mintemp.toInt()}"),
                ],)
              ],
            ),
            Spacer(),
            Text("${comedata!.weatherstate}",style:TextStyle(fontWeight:FontWeight.bold,fontSize:32),),
            Spacer(flex:5,),
          ],
        ),
      ),
    );
  }
}
