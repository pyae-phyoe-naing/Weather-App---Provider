
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/weather_detail_provider.dart';

import '../data/model/city_model.dart';
import '../provider/search_city_provider.dart';
import '../screen/weather_detail_screen.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherDetailProvider weatherDetailProvider = Provider.of<WeatherDetailProvider>(context,listen: false);
    return  Consumer(builder: (context, SearchCityProvider scp, child) {
      List<CityModel> cities = scp.cities;
      if (scp.isLoading) {
        return const Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (scp.isError) {
        return const Padding(
          padding: EdgeInsets.all(50.0),
          child: Center(
            child: Text('Something Wrong'),
          ),
        );
      }
      return Expanded(
        child: ListView.builder(
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  weatherDetailProvider.getCurrentWeatherDetail(lat: cities[index].lat ?? 0.0, lon: cities[index].lon ?? 0.0);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WeatherDetailScreen(name: cities[index].name ?? '',)));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    ListTile(title: Text(cities[index].name ?? ''),subtitle: Text(cities[index].state ?? ''),),
                  ),
                ),
              );
            }),
      );
    });
  }
}
