import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/data/model/current_weather.dart';
import 'package:untitled/provider/weather_detail_provider.dart';

class WeatherDetailScreen extends StatefulWidget {
  const WeatherDetailScreen({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _WeatherDetailScreenState createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name), centerTitle: true),
      body: Consumer<WeatherDetailProvider>(
        builder: (context, WeatherDetailProvider wdp, child) {
          CurrentWeatherModel detail = wdp.currentWeatherModel!;
          if (wdp.isLoading) {
            return const Padding(
              padding: EdgeInsets.all(50.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (wdp.isError) {
            return const Padding(
              padding: EdgeInsets.all(50.0),
              child: Center(
                child: Text('Something Wrong'),
              ),
            );
          }

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  Color(0xff5C6BC0),
                  Color(0xff3949AB),
                  Color(0xff283593),
                ]),
            ),
            child:
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text('Country : ${detail.sys!.country}',style:const  TextStyle(color: Colors.white,fontSize: 20,),),
                  const Divider(),
                  Text('Max Temp : ${detail.main!.tempMax}',style:const  TextStyle(color: Colors.white,fontSize: 20,),),
                  const Divider(),
                  Text('Min Temp : ${detail.main!.tempMin}',style:const  TextStyle(color: Colors.white,fontSize: 20,),),
                  const Divider(),
                  Image.network('https://openweathermap.org/img/wn/${detail.weather![0].icon}@2x.png'),
                  const Divider(),
                  Text('${detail.weather![0].main}',style:const  TextStyle(color: Colors.white,fontSize:30,),),
                  const Divider(),
                  Text('Current Temp : ${detail.main!.temp}',style:const  TextStyle(color: Colors.white,fontSize: 20,),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
