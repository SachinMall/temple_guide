import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserCurrentLocation extends StatefulWidget {
  final void Function(String) onLocationChanged;

  const UserCurrentLocation({
    Key? key,
    required this.onLocationChanged,
  }) : super(key: key);

  @override
  State<UserCurrentLocation> createState() => _UserCurrentLocationState();
}

class _UserCurrentLocationState extends State<UserCurrentLocation> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _pGooglePlex =
      CameraPosition(target: LatLng(17.385044, 78.486671), zoom: 14);

  final List<Marker> _markers = <Marker>[
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(17.385044, 78.486671),
      infoWindow: InfoWindow(title: "Current Location"),
    ),
  ];

  Future<void> loadData() async {
    Position userLocation = await getUserCurrentLocation();

    _markers.add(
      Marker(
        markerId: const MarkerId("2"),
        position: LatLng(userLocation.latitude, userLocation.longitude),
        infoWindow: const InfoWindow(title: "My current location"),
      ),
    );

    CameraPosition cameraPosition = CameraPosition(
      zoom: 14,
      target: LatLng(userLocation.latitude, userLocation.longitude),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String locationText =
        "User Location: ${userLocation.latitude}, ${userLocation.longitude}";
    widget.onLocationChanged(locationText); // Call the callback function
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("error$error");
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _pGooglePlex,
        myLocationButtonEnabled: true,
        markers: Set<Marker>.of(_markers),
        compassEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getUserCurrentLocation().then((value) async {
            _markers.add(
              Marker(
                markerId: const MarkerId("2"),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: const InfoWindow(title: "My current location"),
              ),
            );

            CameraPosition cameraPosition = CameraPosition(
              zoom: 14,
              target: LatLng(value.latitude, value.longitude),
            );

            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        child: const Icon(Icons.local_activity),
      ),
    );
  }
}
