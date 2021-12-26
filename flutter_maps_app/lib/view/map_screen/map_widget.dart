// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_maps_app/data/services/location_services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapWidget extends StatefulWidget {
//   const MapWidget({Key? key}) : super(key: key);

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {
//   final Completer<GoogleMapController> _mapController = Completer();
//   static Position? position;
//   static CameraPosition cameraPosition = CameraPosition(
//     target: LatLng(position!.latitude, position!.altitude),
//     bearing: 0.0,
//     tilt: 0.0,
//     zoom: 15,
//   );

//   getCurrentLocation() async {
//     await LocationServices.getcurrentLocation();
//     position = await Geolocator.getLastKnownPosition().whenComplete(() {
//       setState(() {});
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapType: MapType.normal,
//       myLocationButtonEnabled: false,
//       initialCameraPosition: cameraPosition,
//       onMapCreated: (GoogleMapController controller) {
//         _mapController.complete(controller);
//       },
//     );
//   }
// }
