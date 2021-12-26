import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_maps_app/data/services/location_services.dart';
import 'package:flutter_maps_app/view/map_screen/drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> mapController = Completer();
  static Position? position;
  FloatingSearchBarController searchBarController =
      FloatingSearchBarController();
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

  buildSearchBar() {
    return FloatingSearchBar(
      controller: searchBarController,
      elevation: 5,
      padding: const EdgeInsets.all(8.0),
      height: 70,
      iconColor: Colors.black,
      hint: 'Searching....',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      openAxisAlignment: 0.0,
      width: 500,
      debounceDelay: const Duration(milliseconds: 500),
      hintStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      queryStyle: const TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      actions: [
        FloatingSearchBarAction(
          showIfClosed: true,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
          color: Colors.blue,
          size: 20,
        ),
      ],
      onQueryChanged: (query) {
        // todo:
      },
      onFocusChanged: (isFocused) {
        // todo:
      },
      transition: CircularFloatingSearchBarTransition(),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: const [
              // todo:
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BuildDrawer(),
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
          buildSearchBar(),
        ],
      ),
    );
  }
}
