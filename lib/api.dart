
import 'dart:convert';
import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:geolocator_web/geolocator_web.dart';
import 'package:sunnydays/constants/api_key.dart';
import "package:http/http.dart" as http;
import 'package:sunnydays/logic/models/weather_model.dart';

try  async {
      // get user's current position(latitude and longitude)

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      bool current;
      if (current) {
        List<Placemark> placemarks = await placemarkFromCoordinates(
            position.latitude, position.longitude);
        Placemark place = placemarks[0];
        log(place.locality.toString() as num);
        var cityName = place.locality!;
      }
      // ignore: prefer_typing_uninitialized_variables
      var cityName;
      var url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
          {'q': cityName, "units": "metric", "appid": apiKey});
      final http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        return WeatherModel.fromMap(decodedJson);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }