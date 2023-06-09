import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class RestaurantMapLocation extends StatefulWidget {
  final LocationData locationData;

  const RestaurantMapLocation({required this.locationData, Key? key})
      : super(key: key);

  @override
  _RestaurantMapLocationState createState() => _RestaurantMapLocationState();
}

class _RestaurantMapLocationState extends State<RestaurantMapLocation> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Map"),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.locationData.latitude!,
            widget.locationData.longitude!,
          ),
          zoom: 12.0,
        ),
        markers: Set<Marker>.from([
          Marker(
            markerId: const MarkerId('restaurant1'),
            position: const LatLng(37.7749, -122.4194),
            infoWindow: const InfoWindow(
              title: 'Restaurant 1',
              snippet: 'Address of restaurant 1',
            ),
          ),
          // Add more markers for other restaurants
        ]),
      ),
    );
  }
}
