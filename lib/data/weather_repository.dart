import 'package:dio/dio.dart';
import 'package:untitled/data/api_service/weather_api_service.dart';
import 'package:untitled/data/model/city_model.dart';
import 'package:untitled/data/model/current_weather.dart';
import 'package:untitled/utils/api_const.dart';

class WeatherRepository {
  late WeatherApiService _weatherApiService;

  WeatherRepository() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        logPrint: (object) {
          print(object);
        }));
    _weatherApiService = WeatherApiService(dio);
  }

  Future<List<CityModel>> getSearchCity({required String city}) =>
      _weatherApiService.searchCity(city: city, limit: limit, appId: appId);

  Future<CurrentWeatherModel> getCurrentWeather(
          {required double lat, required double lon}) =>
      _weatherApiService.currentWeather(
          lat: lat, lon: lon, appId: appId, unit: unit);
}
