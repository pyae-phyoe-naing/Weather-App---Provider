import 'package:flutter/foundation.dart';
import 'package:untitled/data/model/city_model.dart';
import 'package:untitled/data/weather_repository.dart';

class SearchCityProvider extends ChangeNotifier{
  late WeatherRepository _weatherRepository;
  late bool isError;
  late List<CityModel> cities;
  SearchCityProvider(){
    _weatherRepository = WeatherRepository();
    cities = [];
    isError = false;
  }
  void getSearchCity({required String city})async{
     try{
      cities = await _weatherRepository.getSearchCity(city: city);
      isError = false;
      notifyListeners();
     }catch(e){
       isError = true;
       notifyListeners();
     }
  }
}