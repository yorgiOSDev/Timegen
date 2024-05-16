import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationService extends ChangeNotifier {
  LatLng DEFAULT_LOCATION = const LatLng(83.513127, 42.351659);
  LatLng _center = const LatLng(83.513127, 42.351659);
  String _address = "";

  // getter
  LatLng get center =>  _center;
  String get address => _address;

  void locationPermissionListener() {
    final locationSettingsStream = Geolocator.getServiceStatusStream();
    locationSettingsStream.listen((ServiceStatus status) {
      locateMe();
    });
  }

  Future<void> locateMe() async {
    _center = DEFAULT_LOCATION;
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _center = LatLng(position.latitude, position.longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(_center.latitude, _center.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _address = '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
      }
    } catch (e) {
    }
    notifyListeners();
  }
}
