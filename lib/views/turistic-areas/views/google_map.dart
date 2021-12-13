import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition:
          CameraPosition(target: LatLng(47.157116, 27.586520), zoom: 9.5),//aici trimite un string
    ));
  }
}
