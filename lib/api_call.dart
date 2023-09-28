import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sunnydays/get_current_position.dart';

Position position = await getCurrentPosition();
if (current) {
  List<Placemark> placemarks = await placemarkFromCoordinates(
   position.latitude, position.longitude);
 Placemark place = placemarks[0];
 cityName = place.locality!;
}