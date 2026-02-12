import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  GoogleMapController? mapController;

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(41.2995, 69.2401), // Toshkent
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xaritadan tanlash")),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        onMapCreated: (controller) {
          mapController = controller;
        },
      ),
    );
  }
}
