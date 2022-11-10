import 'package:flutter/foundation.dart';
import 'package:untitled/data/model/current_weather.dart';
import 'package:untitled/data/weather_repository.dart';

class WeatherDetailProvider extends ChangeNotifier {
  late WeatherRepository _weatherRepository;
  late CurrentWeatherModel _currentWeatherModel;
  bool isError = false;
  bool isLoading = false;

  WeatherDetailProvider() {
    _weatherRepository = WeatherRepository();
  }
  void getCurrentWeatherDetail({required double lat,required double lon})async{
    try{
      isLoading = true;
      notifyListeners();
      _currentWeatherModel  = await _weatherRepository.getCurrentWeather(lat: lat, lon: lon);
      isError = false;
      isLoading = false;
      notifyListeners();
    }catch(e){
      isLoading = false;
      isError = true;
      notifyListeners();
    }
  }
}
