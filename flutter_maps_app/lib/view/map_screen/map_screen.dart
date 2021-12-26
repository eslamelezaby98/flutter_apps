import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_maps_app/data/services/location_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> mapController = Completer();
  static Position? position;
  static final CameraPosition cameraPosition = CameraPosition(
    target: LatLng(position!.latitude, position!.longitude),
    bearing: 0.0,
    tilt: 0.0,
    zoom: 10,
  );

  getCurrentLocation() async {
    position = await LocationServices.getcurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }


  getMapWidget() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      initialCameraPosition: cameraPosition,
      
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);

      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: _goToMyCurrentLocation,
        child: const Icon(Icons.place, color: Colors.white),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? getMapWidget()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
        ],
      ),
    );
  }

 
}
