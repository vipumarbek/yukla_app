import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xaritadan tanlash")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(41.2995, 69.2401),
          zoom: 12,
        ),
        onTap: (position) {
          setState(() {
            selectedLocation = position;
          });
        },
        markers: selectedLocation == null
            ? {}
            : {
                Marker(
                  markerId: const MarkerId("point"),
                  position: selectedLocation!,
                )
              },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, selectedLocation);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
