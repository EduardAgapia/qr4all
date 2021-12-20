import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/domain/gals.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String jSonLocation = 'assets/en-gals.json';
  List<Gal> _gals = List.empty(growable: true);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      _markers.addAll(markers);
      readJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.home),
              title: Text("Meniu Principal"), // i18n
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZoneTuristice(galList: _gals),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.dangerous),
              title: const Text('Placeholder'), // i18n
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Placeholder(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.dangerous),
              title: const Text('Placeholder'), // i18n
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Placeholder(),
                  ),
                );
              },
            ),
          ],
        ),
        body: GoogleMap(
          markers: _markers,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: const CameraPosition(
              target: LatLng(47.208774, 27.150350), zoom: 9),
        ),
      ),
    );
  }

  Future<void> readJson() async {
    if (roSystemLanguage()) {
      jSonLocation = 'assets/ro-gals.json';
    }
    final String response = await rootBundle.loadString(jSonLocation);
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      _gals = Gals.fromJson(data).gals;
    });
  }

  bool roSystemLanguage() {
    return Platform.localeName.contains("ro");
  }

  List<Marker> markers = [
    //make dinamic
    const Marker(
        markerId: MarkerId('Codrii Pascanilor'),
        position: LatLng(47.249624, 26.720125),
        infoWindow: InfoWindow(title: 'Codrii Pascanilor')),
    const Marker(
        markerId: MarkerId('Belcesti-Focuri'),
        position: LatLng(47.216394, 27.148312),
        infoWindow: InfoWindow(title: 'Belcesti-Focuri')),
    const Marker(
        markerId: MarkerId('Dealurile bohotinului'),
        position: LatLng(46.947622, 27.986547),
        infoWindow: InfoWindow(title: 'Dealurile bohotinului')),
    const Marker(
        markerId: MarkerId('Rediu-Prajeni'),
        position: LatLng(47.232995, 27.500137),
        infoWindow: InfoWindow(title: 'Rediu-Prajeni')),
    const Marker(
        markerId: MarkerId('Siret-Moldova'),
        position: LatLng(47.362216, 26.689119),
        infoWindow: InfoWindow(title: 'Siret-Moldova')),
    const Marker(
        markerId: MarkerId('Stefan cel Mare'),
        position: LatLng(47.204105, 27.602336),
        infoWindow: InfoWindow(title: 'Stefan cel Mare')),
    const Marker(
        markerId: MarkerId('Stejarii Argintii'),
        position: LatLng(47.144530, 27.520261),
        infoWindow: InfoWindow(title: 'Stejarii Argintii')),
    const Marker(
        markerId: MarkerId('Valea Prutului'),
        position: LatLng(47.281021, 27.518267),
        infoWindow: InfoWindow(title: 'Valea Prutului')),
    const Marker(
        markerId: MarkerId('Colinele Iasului'),
        position: LatLng(47.060847, 27.568177),
        infoWindow: InfoWindow(title: 'Colinele Iasului')),
  ];
}
