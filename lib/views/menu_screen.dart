import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Gal> galList = List.empty(growable: true);
  var _gals;
  Set<Marker> _markers = {};

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/ro-gals.json');
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      _gals = Gal.fromJson(data);
    });
  }

  List<Marker> markers = [
    Marker(
        markerId: MarkerId('Pascani'), position: LatLng(47.249624, 26.720125)),
    Marker(
        markerId: MarkerId('Belcesti-Focuri'),
        position: LatLng(47.216394, 27.148312)),
    Marker(
        markerId: MarkerId('DEalurile bohotinului'),
        position: LatLng(46.947622, 27.986547)),
    Marker(
        markerId: MarkerId('Rediu-Prajeni'),
        position: LatLng(47.232995, 27.500137)),
    Marker(
        markerId: MarkerId('Siret-Moldova'),
        position: LatLng(47.362216, 26.689119)),
    Marker(
        markerId: MarkerId('Stefan cel Mare'),
        position: LatLng(47.204105, 27.602336)),
    Marker(
        markerId: MarkerId('Stejarii Argintii'),
        position: LatLng(47.144530, 27.520261)),
    Marker(
        markerId: MarkerId('Valea Prutului'),
        position: LatLng(47.281021, 27.518267)),
    Marker(
        markerId: MarkerId('Colinele Iasului'),
        position: LatLng(47.060847, 27.568177)),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      galList = Gal.performSingleFetch();
      _markers.addAll(markers);
      readJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('~~~~~~~~~~~~>: $_gals');
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
              title:  Text(_gals.toString()),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ZoneTuristice(galList: galList),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.dangerous),
              title: const Text('Placeholder'),
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
              title: const Text('Placeholder'),
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
          initialCameraPosition:
              const CameraPosition(target: LatLng(47.208774, 27.150350), zoom: 9),
        ),
      ),
    );
  }
}
