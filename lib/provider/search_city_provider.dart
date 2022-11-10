import 'package:flutter/foundation.dart';
import 'package:untitled/data/model/city_model.dart';
import 'package:untitled/data/weather_repository.dart';

class SearchCityProvider extends ChangeNotifier{
  late WeatherRepository _weatherRepository;
   bool isError = false;
  bool isLoading = false;
  late List<CityModel> cities;
  SearchCityProvider(){
    _weatherRepository = WeatherRepository();
    cities = [];
  }
  void getSearchCity({required String city})async{
     try{
       isLoading = true;
       notifyListeners();
      cities = await _weatherRepository.getSearchCity(city: city);
      isError = false;
      isLoading = false;
      notifyListeners();
     }catch(e){
       isError = true;
       isLoading = false;
       notifyListeners();
     }
  }
}