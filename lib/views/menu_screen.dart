import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/domain/gals.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/objectives_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

import '../scanner.dart';

class MenuScreen extends StatefulWidget {
  final bool isRo;
  const MenuScreen({Key? key, required this.isRo}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState(isRo: isRo);
}

class _MenuScreenState extends State<MenuScreen> {
  final bool isRo;
  Set<Polygon> _polygons = HashSet<Polygon>();
  String jSonLocation = 'assets/en-gals.json';
  List<Gal> _gals = List.empty(growable: true);
  final Set<Marker> _markers = {};
  double lat = 46.948958;
  double lon = 27.508986;


  _MenuScreenState({required this.isRo});


  @override
  void initState() {
    super.initState();
    setState(() {
      if(!isRo){
      }
      readJson(isRo);
      _setPolygons();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
      const Marker(
        markerId: MarkerId('Codri Pascanilor'),
        position: LatLng(47.249624, 26.720125),
        infoWindow: InfoWindow(title: 'Codrii Pascanilor'),
      ),
      // const Marker(
      //     markerId: MarkerId('Belcesti-Focuri'),
      //     position: LatLng(47.216394, 27.148312),
      //     infoWindow: InfoWindow(title: 'Belcesti-Focuri')),
      const Marker(
          markerId: MarkerId('Dealurile bohotinului'),
          position: LatLng(46.947622, 27.986547),
          infoWindow: InfoWindow(title: 'Dealurile bohotinului')),
      // const Marker(
      //     markerId: MarkerId('Rediu-Prajeni'),
      //     position: LatLng(47.232995, 27.500137),
      //     infoWindow: InfoWindow(title: 'Rediu-Prajeni')),
      const Marker(
          markerId: MarkerId('Siret-Moldova'),
          position: LatLng(47.362216, 26.689119),
          infoWindow: InfoWindow(title: 'Siret-Moldova')),
      // const Marker(
      //     markerId: MarkerId('Stefan cel Mare'),
      //     position: LatLng(47.204105, 27.602336),
      //     infoWindow: InfoWindow(title: 'Stefan cel Mare')),
      const Marker(
          markerId: MarkerId('Stejarii Argintii'),
          position: LatLng(47.144530, 27.520261),
          infoWindow: InfoWindow(title: 'Stejarii Argintii')),
      // const Marker(
      //     markerId: MarkerId('Valea Prutului'),
      //     position: LatLng(47.281021, 27.518267),
      //     infoWindow: InfoWindow(title: 'Valea Prutului')),
      const Marker(
          markerId: MarkerId('Colinele Iasului'),
          position: LatLng(47.060847, 27.568177),
          infoWindow: InfoWindow(title: 'Colinele Iasului')),
    ];

    return Scaffold(
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(AppLocalizations.of(context).mainMenu),
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
            leading: const Icon(Icons.qr_code_scanner_sharp),
            title: Text(AppLocalizations.of(context).qrScan),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRViewExample(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.near_me_sharp),
            title: Text(AppLocalizations.of(context).nearMe),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ObjectivesScreen(objectives: _gals[0].objectives),
                ),
              );
            },
          ),
        ],
      ),
      body: GoogleMap(
        polygons: Set.of(_polygons),
        markers: markers.toSet(),
        onMapCreated: (mapController) {
          mapController.showMarkerInfoWindow(
              _markers.elementAt(Random().nextInt(_markers.length)).markerId);
        },
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, lon), zoom: 8.2),
      ),
    );
  }

  void _setPolygons() {
    // belcestFocuriPolygon();
    codriiPascanilorPoligon();
    dealurileBohotinuluiPolygons();
    // rediuPolygons();
    siretPolygons();
    // stefanPolygons();
    stejariPolygons();
    // prutPolygons();
    iasiPolygons();
  }

  void iasiPolygons() {
    List<LatLng> iasi = [
      LatLng(46.891919, 27.147269),
      LatLng(46.901397, 27.642410),
      LatLng(47.065763, 27.664804),
      LatLng(47.136207, 27.606252),
      LatLng(47.093581, 27.536807),
      LatLng(47.096302, 27.410200),
      LatLng(46.940842, 27.094062),
      LatLng(46.891919, 27.147269),

    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("iasi"),
        points: iasi,
        fillColor: Colors.blueGrey.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Colinele Iasilor")),
              ),
            );
          }
      ),
    );
  }

  void prutPolygons() {
    List<LatLng> prut = [
      LatLng(47.210251, 27.567399),
      LatLng(47.303691, 27.659410),
      LatLng(47.832476, 27.195978),
      LatLng(47.847133, 27.132896),
      LatLng(47.650378, 27.221536),
      LatLng(47.630759, 27.256201),
      LatLng(47.570922, 27.289479),
      LatLng(47.523190, 27.225696),
      LatLng(47.489668, 27.372886),
      LatLng(47.400069, 27.411759),
      LatLng(47.365016, 27.340096),
      LatLng(47.226108, 27.519677),
      LatLng(47.210251, 27.567399),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("prut"),
        points: prut,
        fillColor: Colors.blueAccent.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Valea Prutului")),
              ),
            );
          }
      ),
    );
  }

  void stejariPolygons() {
    List<LatLng> stejari = [
      LatLng(47.012818, 27.238152),
      LatLng(47.194943, 27.167163),
      LatLng(46.940842, 27.094062),
      LatLng(47.096302, 27.410200),
      LatLng(47.093581, 27.536807),
      LatLng(47.136207, 27.606252),
      LatLng(47.254251, 27.333976),
      LatLng(47.186202, 27.295618),
      LatLng(47.183529, 27.214596),
      LatLng(47.012818, 27.238152),

    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("stejari"),
        points: stejari,
        fillColor: Colors.green.withOpacity(0.4),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Stejarii-Argintii")),
              ),
            );
          }
      ),
    );
  }

  void stefanPolygons() {
    List<LatLng> stefan = [
      LatLng(47.238362, 27.605901),
      LatLng(47.217944, 27.563237),
      LatLng(47.165759, 27.630280),
      LatLng(47.229258, 27.731860),
      LatLng(47.238362, 27.605901),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("stefan"),
        points: stefan,
        fillColor: Colors.white.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Stefan cel Mare")),
              ),
            );
          }
      ),
    );
  }

  void siretPolygons() {
    List<LatLng> siretMoldova = [
      LatLng(47.354336, 26.693541),
      LatLng(47.378722, 27.296085),
      LatLng(47.493647, 26.907239),
      LatLng(47.354336, 26.693541),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("siretMoldova"),
        points: siretMoldova,
        fillColor: Colors.orange.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Siret-Moldova")),
              ),
            );
          }
      ),
    );
  }

  void rediuPolygons() {
    List<LatLng> rediuPrajeni = [
      LatLng(47.256616, 27.493078),
      LatLng(47.192857, 27.464609),
      LatLng(47.206442, 27.534369),
      LatLng(47.243781, 27.512420),
      LatLng(47.256616, 27.493078),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("rediuPrajeni"),
        points: rediuPrajeni,
        fillColor: Colors.white.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Rediu-prajeni")),
              ),
            );
          }
      ),
    );
  }

  void dealurileBohotinuluiPolygons() {
    List<LatLng> dealurileBohotinului = [
      LatLng(46.991041, 28.020023),
      LatLng(46.893157, 28.071244),
      LatLng(46.928148, 27.864852),
      LatLng(46.988472, 27.887199),
      LatLng(46.991041, 28.020023),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("dealurileBohotinului"),
        points: dealurileBohotinului,
        fillColor: Colors.purple.withOpacity(0.5),
        strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Dealurile Bohotinului")),
              ),
            );
          }
      ),
    );
  }

  void codriiPascanilorPoligon() {
    List<LatLng> codriiPascanilor = [
      LatLng(47.577466, 26.140817),
      LatLng(46.810293, 26.512840),
      LatLng(47.199039, 27.019974),
      LatLng(47.319628, 26.781214),
      LatLng(47.577466, 26.140817),
    ];
    _polygons.add(
      Polygon(
        polygonId: PolygonId("codriiPascanilor"),
        points: codriiPascanilor,
        fillColor: Colors.yellowAccent.withOpacity(0.5),
          consumeTapEvents: true,
        strokeWidth: 1,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Codrii Pascanilor")),
              ),
            );
          }
      ),
    );
  }

  void belcestFocuriPolygon() {
    List<LatLng> belcestiFocuri = [
      LatLng(47.307216, 27.086495),
      LatLng(47.385831, 27.118326),
      LatLng(47.366478, 27.201394),
      LatLng(47.359128, 27.208863),
      LatLng(47.343899, 27.210102),
      LatLng(47.343100, 27.195943),
      LatLng(47.322131, 27.209709),
      LatLng(47.316087, 27.228587),
      LatLng(47.251789, 27.252865),
      LatLng(47.253029, 27.239372),
      LatLng(47.201564, 27.144790),
      LatLng(47.219180, 27.106555),
      LatLng(47.307216, 27.086495),
    ];
    _polygons.add(
      Polygon(
          polygonId: PolygonId("belcestiFocuri"),
          points: belcestiFocuri,
          fillColor: Colors.white.withOpacity(0.5),
          strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Belcesti-Focuri")),
              ),
            );
          }),
    );
  }

  Gal getGal(String galName) => _gals.firstWhere((element) => element.name == galName);

  Future<void> readJson(bool isRo) async {
    if (isRo) {
      jSonLocation = 'assets/ro-gals.json';
    }
    final String response = await rootBundle.loadString(jSonLocation);
    final Map<String, dynamic> data = await json.decode(response);
    setState(() {
      _gals = Gals.fromJson(data).gals;
    });
  }
  //
  // bool roSystemLanguage() {
  //   return Platform.localeName.contains("ro");
  // }
}
