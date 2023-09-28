
import "package:http/http.dart" as http;
import 'package:sunnydays/constants/api_key.dart';


var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
  {'q': cityName, "units": "metric", "appid": apiKey});
  
  mixin cityName {
  }
final http.Response response = await http.get(url);