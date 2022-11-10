
import 'package:retrofit/http.dart';
import 'package:untitled/data/model/city_model.dart';
import 'package:untitled/data/model/current_weather.dart';
import 'package:untitled/utils/api_const.dart';
import 'package:dio/dio.dart';
part 'weather_api_service.g.dart';
@RestApi(baseUrl: baseUrl )
abstract class WeatherApiService{
   factory WeatherApiService (Dio dio)=> _WeatherApiService(dio);

   @GET(searchCityUrl)
   Future<List<CityModel>> searchCity({@Query('q') required String city,@Query('limit') required int limit,@Query('appid') required String appId});

   @GET(currentWeatherUrl)
   Future<CurrentWeatherModel>currentWeather({@Query('lat') required double lat,@Query('lon') required double lon,@Query('appid') required String appId,@Query('units') required String unit});

}