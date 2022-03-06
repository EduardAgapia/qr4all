import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/domain/gals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/objectives_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

import '../scanner.dart';
import '../user_location.dart';

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

  late UserLocation _currentLocation;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await Geolocator.getCurrentPosition();
      lat = userLocation.latitude;
      lon = userLocation.longitude;
    } catch (e) {
      print("Could not get the location");
    }
    return _currentLocation;
  }

  _MenuScreenState({required this.isRo});

  @override
  void initState() {
    super.initState();
    getLocation();
    setState(() {
      if (!isRo) {}
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
      bottomSheet: WillPopScope(
        onWillPop: () async => false,
        child: Column(
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
      ),
      body: GoogleMap(
        polygons: Set.of(_polygons),
        // markers: markers.toSet(),
        // onMapCreated: (mapController) {
        //   mapController.showMarkerInfoWindow(
        //       _markers.elementAt(Random().nextInt(_markers.length)).markerId);
        // },
        myLocationButtonEnabled: true,
        zoomControlsEnabled: true,
        initialCameraPosition:
            CameraPosition(target: LatLng(lat, lon), zoom: 8.5),
      ),
    );
  }

  void _setPolygons() {
    dealurileBohotinuluiPolygons();
    belcestFocuriPolygon();
    codriiPascanilorPoligon();
    rediuPolygons();
    siretPolygons();
    stefanPolygons();
    stejariPolygons();
    prutPolygons();
    iasiPolygons();
  }

  void iasiPolygons() {
    List<LatLng> iasi = [
      LatLng(46.891919, 27.147269),
      LatLng(46.875890, 27.186938),
      LatLng(46.881860, 27.198731),
      LatLng(46.870814, 27.221878),
      LatLng(46.877979, 27.250266),
      LatLng(46.873501, 27.262932),
      LatLng(46.874994, 27.292631),
      LatLng(46.861856, 27.307917),


      LatLng(46.861856, 27.307917),




      LatLng(46.869023, 27.328880),
      LatLng(46.891412, 27.387841),
      LatLng(46.875890, 27.408804),
      LatLng(46.878278, 27.437629),
      LatLng(46.870602, 27.442822),
      LatLng(46.875685, 27.466983),
      LatLng(46.865129, 27.476276),
      LatLng(46.867475, 27.485140),
      LatLng(46.879301, 27.485997),
      LatLng(46.879887, 27.516449),
      LatLng(46.887118, 27.531032),
      LatLng(46.918083, 27.521024),
      LatLng(46.919938, 27.529316),
      LatLng(46.874414, 27.562056),
      LatLng(46.887216, 27.566059),
      LatLng(46.910651, 27.639684),
      LatLng(46.922584, 27.629202),
      LatLng(46.923777, 27.613479),
      LatLng(46.939882, 27.618720),
      LatLng(46.957174, 27.606055),
      LatLng(46.989657, 27.628765),
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
                builder: (context) =>
                    ZoneScreen(gal: getGal("Colinele Iasului")),
              ),
            );
          }),
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
      LatLng(47.519833, 27.206379),
      LatLng(47.475140, 27.313048),
      LatLng(47.468681, 27.372446),
      LatLng(47.411435, 27.407697),
      LatLng(47.349988, 27.377103),
      LatLng(47.212958, 27.493581),
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
                builder: (context) => ZoneScreen(gal: getGal("Valuea Prutului")),
              ),
            );
          }),
    );
  }

  void stejariPolygons() {
    List<LatLng> stejari = [
      LatLng(47.012818, 27.238152),
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
                builder: (context) =>
                    ZoneScreen(gal: getGal("Stejarii-Argintii")),
              ),
            );
          }),
    );
  }

  void stefanPolygons() {
    List<LatLng> stefan = [
      LatLng(46.861856, 27.307917),
      LatLng(46.869023, 27.328880),
      LatLng(46.891412, 27.387841),
      LatLng(46.875890, 27.408804),
      LatLng(46.878278, 27.437629),
      LatLng(46.870602, 27.442822),
      LatLng(46.875685, 27.466983),
      LatLng(46.865129, 27.476276),
      LatLng(46.867475, 27.485140),
      LatLng(46.879301, 27.485997),
      LatLng(46.879887, 27.516449),
      LatLng(46.887118, 27.531032),
      LatLng(46.918083, 27.521024),
      LatLng(46.919938, 27.529316),
      LatLng(46.874414, 27.562056),
      LatLng(46.887216, 27.566059),
      LatLng(46.910651, 27.639684),
      LatLng(46.922584, 27.629202),
      LatLng(46.923777, 27.613479),
      LatLng(46.939882, 27.618720),
      LatLng(46.957174, 27.606055),
      LatLng(46.989657, 27.628765),
      LatLng(47.065763, 27.664804),
      LatLng(46.933841, 27.768642),
      LatLng(46.922907, 27.816673),
      LatLng(46.953880, 27.828681),
      LatLng(47.046691, 27.776647),
      LatLng(47.210111, 27.647366),
      LatLng(47.210251, 27.567399),
      LatLng(47.303691, 27.659410),
      LatLng(47.035085, 27.986369),
      LatLng(47.038896, 27.990048),
      LatLng(47.034985, 27.996228),
      LatLng(47.029869, 27.994463),
           // LatLng(),

      LatLng(47.023817, 28.014500),//punct comun cu dealBo
      LatLng(47.015890, 27.991332),
      LatLng(47.015890, 27.974097),
      LatLng(46.958748, 27.877354),//punct comun cu dealBo
      LatLng(46.846506, 27.888904),
      LatLng(46.863675, 27.823494),
      LatLng(46.808533, 27.690031),
      LatLng(46.839275, 27.553265),
      LatLng(46.813254, 27.328156),
      LatLng(46.861856, 27.307917),

    ];
    _polygons.add(
      Polygon(
          polygonId: PolygonId("stefan"),
          points: stefan,
          fillColor: Colors.brown.withOpacity(0.5),
          strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ZoneScreen(gal: getGal("Stefan cel Mare")),
              ),
            );
          }),
    );
  }

  void siretPolygons() {
    List<LatLng> siretMoldova = [
      LatLng(47.351768, 26.616604),
      LatLng(47.361607, 26.678770),
      LatLng(47.414663, 26.680145),
      LatLng(47.366884, 26.724140),
      LatLng(47.408439, 27.061569),
      LatLng(47.308935, 27.019922),
      LatLng(47.293730, 26.838735),
      LatLng(47.230548, 26.805135),
      LatLng(47.293255, 26.749135),
      LatLng(47.278157, 26.711444),
      LatLng(47.255783, 26.658813),
      LatLng(47.351768, 26.616604),
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
          }),
    );
  }

  void rediuPolygons() {
    List<LatLng> rediuPrajeni = [
      LatLng(47.254251, 27.333976),
      LatLng(47.424405, 27.226946),
      LatLng(47.467589, 27.079803),
      LatLng(47.515649, 27.076713),
      LatLng(47.551382, 27.098632),
      LatLng(47.519833, 27.206379),
      LatLng(47.511802, 27.223764),
      LatLng(47.475140, 27.313048),
      LatLng(47.468681, 27.372446),
      LatLng(47.411435, 27.407697),
      LatLng(47.349988, 27.377103),
      LatLng(47.179577, 27.524507),
      LatLng(47.182990, 27.498520),
      LatLng(47.254251, 27.333976)


    ];
    _polygons.add(
      Polygon(
          polygonId: PolygonId("rediuPrajeni"),
          points: rediuPrajeni,
          fillColor: Colors.orange.withOpacity(0.5),
          strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ZoneScreen(gal: getGal("Rediu-prajeni")),
              ),
            );
          }),
    );
  }

  void dealurileBohotinuluiPolygons() {
    List<LatLng> dealurileBohotinului = [
      LatLng(46.856110, 27.954457),
      LatLng(46.857956, 27.978310),
      LatLng(46.837333, 27.992111),

      LatLng(46.839492, 27.999131),

      LatLng(46.836701, 28.006273),
      LatLng(46.838595, 28.009625),
      LatLng(46.837099, 28.016766),
      LatLng(46.837199, 28.028718),
      LatLng(46.840290, 28.034985),
      LatLng(46.841984, 28.042855),
      LatLng(46.843879, 28.048539),
      LatLng(46.843081, 28.058741),
      LatLng(46.844975, 28.065008),

      LatLng(46.841187, 28.112230),
      LatLng(46.850159, 28.118934),
      LatLng(46.847368, 28.123598),
      LatLng(46.853049, 28.127533),
      LatLng(46.853348, 28.118060),
      LatLng(46.855242, 28.117331),
      LatLng(46.856239, 28.123452),
      LatLng(46.866403, 28.107129),
      LatLng(46.868496, 28.112084),
      LatLng(46.869791, 28.111501),
      LatLng(46.870389, 28.098967),
      LatLng(46.873378, 28.102756),
      LatLng(46.873179, 28.109315),
      LatLng(46.877164, 28.114416),
      LatLng(46.877961, 28.119080),
      LatLng(46.879655, 28.118497),
      LatLng(46.882046, 28.112521),
      LatLng(46.892505, 28.114125),
      LatLng(46.895990, 28.110044),
      LatLng(46.890712, 28.109606),
      LatLng(46.890114, 28.106983),
      LatLng(46.896588, 28.103048),
      LatLng(46.892505, 28.096052),
      LatLng(46.896986, 28.093429),
      LatLng(46.895692, 28.085121),
      LatLng(46.899376, 28.089494),
      LatLng(46.901966, 28.083372),
      LatLng(46.906845, 28.087162),
      LatLng(46.904555, 28.094886),
      LatLng(46.905451, 28.096344),
      LatLng(46.909234, 28.094157),
      LatLng(46.910628, 28.096635),
      LatLng(46.908936, 28.102028),
      LatLng(46.922575, 28.113250),
      LatLng(46.929045, 28.096198),
      LatLng(46.929940, 28.098967),
      LatLng(46.929542, 28.101736),
      LatLng(46.928149, 28.106400),
      LatLng(46.930737, 28.106546),
      LatLng(46.933623, 28.099696),
      LatLng(46.934220, 28.084392),
      LatLng(46.937205, 28.081478),
      LatLng(46.938499, 28.084247),
      LatLng(46.936011, 28.085850),
      LatLng(46.934817, 28.087890),
      LatLng(46.937405, 28.090951),
      LatLng(46.941186, 28.087599),
      LatLng(46.941584, 28.089202),
      LatLng(46.939395, 28.091971),
      LatLng(46.940091, 28.096052),
      LatLng(46.949046, 28.098676),
      LatLng(46.950837, 28.096344),
      LatLng(46.947256, 28.091825),
      LatLng(46.954717, 28.093574),
      LatLng(46.957403, 28.094012),
      LatLng(46.956607, 28.087307),
      LatLng(46.962974, 28.078417),
      LatLng(46.964565, 28.081623),
      LatLng(46.966032, 28.086688),
      LatLng(46.971663, 28.085036),
      LatLng(46.974536, 28.094045),
      LatLng(46.979074, 28.096570),
      LatLng(46.981831, 28.089246),
      LatLng(46.985047, 28.085709),
      LatLng(46.985564, 28.081079),
      LatLng(46.985392, 28.078385),
      LatLng(46.986598, 28.078637),
      LatLng(46.989814, 28.082931),
      LatLng(46.991308, 28.079395),
      LatLng(47.000036, 28.054389),
      LatLng(47.003851, 28.055998),
      LatLng(47.006359, 28.052319),
      LatLng(47.004152, 28.051583),
      LatLng(47.002145, 28.048934),
      LatLng(47.007363, 28.039811),
      LatLng(47.008968, 28.042901),
      LatLng(47.012681, 28.038192),
      LatLng(47.018300, 28.045402),
      LatLng(47.013785, 28.050994),
      LatLng(47.014286, 28.054232),
      LatLng(47.025322, 28.047757),
      LatLng(47.021209, 28.043931),
      LatLng(47.021710, 28.040399),
      LatLng(47.025121, 28.040252),
      LatLng(47.030538, 28.036132),
      LatLng(47.030237, 28.025831),
      LatLng(47.024921, 28.023035),
       LatLng(47.023316, 28.019356),
      LatLng(47.023817, 28.014500),
      LatLng(47.015890, 27.991332),
      LatLng(47.015890, 27.974097),
      // LatLng(),
      // LatLng(),
      // LatLng(),
      // LatLng(),
      LatLng(46.958748, 27.877354),
      // LatLng(),
      LatLng(46.856110, 27.954457),
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
                builder: (context) =>
                    ZoneScreen(gal: getGal("Dealurile Bohotinului")),
              ),
            );
          }),
    );
  }

  void codriiPascanilorPoligon() {
    List<LatLng> codriiPascanilor = [
      LatLng(47.111827, 26.679991),
      LatLng(47.186939, 26.805101),
      LatLng(47.225234, 26.765231),
      LatLng(47.204220, 26.670930),
      LatLng(47.351768, 26.616604),
      LatLng(47.397567, 26.550336),
      LatLng(47.391115, 26.495416),
      LatLng(47.340571, 26.509375),
      LatLng(47.311161, 26.568946),
      LatLng(47.290538, 26.577570),
      LatLng(47.269126, 26.502085),
      LatLng(47.171537, 26.623747),
      LatLng(47.094836, 26.617978),
      LatLng(47.111827, 26.679991),
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
                builder: (context) =>
                    ZoneScreen(gal: getGal("Codrii Pascanilor")),
              ),
            );
          }),
    );
  }

  void belcestFocuriPolygon() {
    List<LatLng> belcestiFocuri = [
      LatLng(47.415205, 26.678717),
      LatLng(47.368396, 26.727727),
      LatLng(47.402231, 27.058105),
      LatLng(47.308935, 27.019922),
      LatLng(47.183529, 27.214596),
      LatLng(47.254251, 27.333976),
      LatLng(47.424405, 27.226946),
      LatLng(47.467589, 27.079803),
      LatLng(47.466963, 27.053891),
      LatLng(47.453824, 27.064071),
      LatLng(47.443185, 27.043711),
      LatLng(47.411434, 26.805196),
      LatLng(47.462017, 26.672190),
      LatLng(47.415205, 26.678717),
    ];
    _polygons.add(
      Polygon(
          polygonId: PolygonId("belcestiFocuri"),
          points: belcestiFocuri,
          fillColor: Colors.redAccent.withOpacity(0.5),
          strokeWidth: 1,
          consumeTapEvents: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ZoneScreen(gal: getGal("Belcesti-Focuri")),
              ),
            );
          }),
    );
  }

  Gal getGal(String galName) =>
      _gals.firstWhere((element) => element.name == galName);

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
