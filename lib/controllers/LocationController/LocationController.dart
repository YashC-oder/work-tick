import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';

class LocationController extends ChangeNotifier {

  Future<bool> isWithinRange(double targetLatitude, double targetLongitude) async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
        return false;
      }

      Position currentPosition = await Geolocator.getCurrentPosition();

      double distance = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        targetLatitude,
        targetLongitude,
      );
      return distance <= 200;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting location: $e');
      }
      return false;
    }
  }
}
