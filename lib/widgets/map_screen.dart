import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/services/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    await _locateMe();
  }

  Future<void> _locateMe() async {
    await Provider.of<LocationService>(context, listen: false).locateMe();
    final center = Provider.of<LocationService>(context, listen: false).center;
    setState(() {
      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: center, zoom: 15.0),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _center = Provider.of<LocationService>(context, listen: false).center;
    return ClipRRect(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
      ),
    );
  }
}
