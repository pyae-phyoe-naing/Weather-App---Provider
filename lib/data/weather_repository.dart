import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:untitled/data/api_service/weather_api_service.dart';
import 'package:untitled/data/model/city_model.dart';
import 'package:untitled/data/model/current_weather.dart';
import 'package:untitled/utils/api_const.dart';

class WeatherRepository {
  late WeatherApiService _weatherApiService;
  final Options _options = buildCacheOptions(
    const Duration(days: 1),
    forceRefresh: true
  );
  WeatherRepository() {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(
        responseBody: true,
        logPrint: (object) {
          print(object);
        }));
    dio.interceptors.add(DioCacheManager(CacheConfig()).interceptor);
    _weatherApiService = WeatherApiService(dio);
  }

  Future<List<CityModel>> getSearchCity({required String city}) =>
      _weatherApiService.searchCity(city: city, limit: limit, appId: appId,options: _options);

  Future<CurrentWeatherModel> getCurrentWeather(
          {required double lat, required double lon}) =>
      _weatherApiService.currentWeather(
          lat: lat, lon: lon, appId: appId, unit: unit,options: _options);
}
