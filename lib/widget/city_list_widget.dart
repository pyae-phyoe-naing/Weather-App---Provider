
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/model/city_model.dart';
import '../provider/search_city_provider.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  ListTile(title: Text(cities[index].name ?? ''),subtitle: Text(cities[index].state ?? ''),),
                ),
              );
            }),
      );
    });
  }
}
