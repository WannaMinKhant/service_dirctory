import 'dart:async';
import 'package:location/location.dart';
import 'package:service_directory/modules/user_location.dart';

class LocationService {
  late final UserLocation _currentLocation;

  Location location = Location();

  StreamController<UserLocation> _locationController =
      StreamController.broadcast();

  Stream<UserLocation> get locationStream => _locationController.stream;

  LocationService() {
    location.requestPermission().then((value) {
      if (value.index.isOdd) {
        location.onLocationChanged.listen((event) {
          if (event != null) {
            _locationController.add(
              UserLocation(
                  latitude: event.latitude, longitude: event.longitude),
            );
          }
        });
      }
    });
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
          latitude: userLocation.latitude, longitude: userLocation.longitude);
    } catch (e) {
      print('Could not get the location : $e');
    }

    return _currentLocation;
  }
}
