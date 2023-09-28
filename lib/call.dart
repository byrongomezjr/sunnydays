import 'package:sunnydays/logic/models/weather_model.dart';
import 'package:sunnydays/logic/services/call_to_api.dart';

Future<WeatherModel> getData(bool isCurrentCity, String cityName) async {
  return await CallToApi().callWeatherAPi(isCurrentCity, cityName);
}
