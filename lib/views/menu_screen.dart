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
      LatLng(46.989657, 27.628765),//pct comun stefan
      LatLng(47.065763, 27.664804),//pct com stefan
      LatLng(47.136207, 27.606252),//pct stejari1
      LatLng(47.139147, 27.588303),
      LatLng(47.137705, 27.574670),
      LatLng(47.110497, 27.566491),
      LatLng(47.113590, 27.550133),
      LatLng(47.111528, 27.540439),
      LatLng(47.093581, 27.536807),//pct stejari2
      LatLng(47.090288, 27.507722),
      LatLng(47.083069, 27.503481),
      LatLng(47.096269, 27.495604),
      LatLng(47.094619, 27.472278),
      LatLng(47.101837, 27.445923),
      LatLng(47.096302, 27.410200),//pct stejari

      LatLng(47.086796, 27.401583),
      LatLng(47.071324, 27.405824),
      LatLng(47.065547, 27.393404),
      LatLng(47.065547, 27.380681),
      LatLng(47.061626, 27.365534),
      LatLng(47.080402, 27.346146),
      LatLng(47.056466, 27.335846),
      LatLng(47.032314, 27.297070),
      LatLng(47.027565, 27.252842),
      LatLng(47.012818, 27.238152),//pct stejari

      LatLng(47.003193, 27.245874),
      LatLng(47.001024, 27.241785),
      LatLng(46.995032, 27.239513),
      LatLng(46.993142, 27.222609),
      LatLng(46.990955, 27.220616),
      LatLng(46.989772, 27.214550),
      LatLng(46.991428, 27.213597),
      LatLng(46.991309, 27.211603),
      LatLng(46.989181, 27.210564),
      LatLng(46.989063, 27.203891),
      LatLng(46.990127, 27.203197),
      LatLng(46.990009, 27.198778),
      LatLng(46.998580, 27.192278),
      LatLng(47.000412, 27.183439),
      LatLng(46.989950, 27.179712),
      LatLng(46.987467, 27.174383),
      LatLng(46.980372, 27.170656),
      LatLng(46.972538, 27.150118),
      LatLng(46.963422, 27.150534),
      LatLng(46.961304, 27.149032),
      LatLng(46.963969, 27.130309),
      LatLng(46.952762, 27.121098),
      //LatLng(),
      //LatLng(),
      //LatLng(),
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
      LatLng(47.210251, 27.567399),//punct comun stefan
      LatLng(47.246797, 27.555171),
      LatLng(47.268413, 27.555346),
      LatLng(47.263545, 27.566721),
      LatLng(47.265801, 27.575646),
      LatLng(47.287290, 27.578226),
      LatLng(47.283119, 27.603352),
      LatLng(47.274415, 27.610836),
      LatLng(47.303691, 27.659410),//punct comun stefan-> granitaModova
      LatLng(47.306674, 27.645776),
      LatLng(47.312920, 27.637455),
      LatLng(47.326417, 27.622003),
      LatLng(47.327594, 27.609735),
      LatLng(47.331864, 27.603960),
      LatLng(47.339573, 27.615509),
      LatLng(47.341945, 27.612710),
      LatLng(47.350008, 27.605710),
      LatLng(47.367315, 27.600985),
      LatLng(47.372767, 27.595035),
      LatLng(47.378811, 27.581560),
      LatLng(47.399781, 27.582435),
      LatLng(47.409612, 27.584010),
      LatLng(47.411033, 27.580685),
      LatLng(47.419678, 27.574560),
      LatLng(47.424769, 27.559160),
      LatLng(47.434003, 27.553210),
      LatLng(47.436489, 27.559160),
      LatLng(47.440750, 27.560910),
      LatLng(47.446076, 27.557410),
      LatLng(47.447851, 27.565635),
      LatLng(47.457555, 27.574210),
      LatLng(47.466073, 27.569660),
      LatLng(47.470923, 27.556185),
      LatLng(47.487718, 27.539910),
      LatLng(47.488428, 27.533610),
      LatLng(47.483461, 27.531860),
      LatLng(47.482751, 27.522410),
      LatLng(47.483106, 27.513310),
      LatLng(47.489255, 27.515935),
      LatLng(47.490083, 27.512610),
      LatLng(47.485117, 27.507535),
      LatLng(47.488664, 27.494760),
      LatLng(47.485590, 27.477436),
      LatLng(47.490911, 27.471836),
      LatLng(47.500370, 27.467461),
      LatLng(47.513491, 27.456961),
      LatLng(47.525192, 27.466411),
      LatLng(47.527791, 27.465536),
      LatLng(47.537362, 27.456261),
      LatLng(47.550592, 27.438236),
      LatLng(47.564055, 27.431411),
      LatLng(47.585070, 27.424411),
      LatLng(47.583417, 27.402886),
      LatLng(47.592270, 27.386086),
      LatLng(47.602182, 27.374186),
      LatLng(47.619997, 27.360887),
      LatLng(47.627074, 27.334287),
      LatLng(47.639456, 27.321862),
      LatLng(47.643347, 27.314687),
      LatLng(47.650421, 27.315212),
      LatLng(47.662090, 27.305587),
      LatLng(47.683183, 27.280037),
      LatLng(47.693197, 27.278462),
      LatLng(47.701559, 27.281787),
      LatLng(47.700499, 27.271112),
      LatLng(47.707683, 27.269187),
      LatLng(47.714395, 27.265687),
      LatLng(47.721812, 27.255712),
      LatLng(47.726639, 27.269362),
      LatLng(47.723343, 27.290537),
      LatLng(47.729464, 27.294562),
      LatLng(47.747941, 27.298237),
      LatLng(47.753236, 27.292112),
      LatLng(47.756295, 27.285987),
      LatLng(47.764882, 27.278112),
      LatLng(47.779584, 27.266212),
      LatLng(47.794164, 27.249762),
      LatLng(47.817201, 27.239263),
      LatLng(47.831183, 27.247663),
      LatLng(47.837174, 27.246263),
      LatLng(47.837997, 27.212488),
      LatLng(47.860456, 27.174758),
      LatLng(47.859371, 27.166266),
      LatLng(47.853130, 27.160605),
      LatLng(47.847133, 27.132896),
      LatLng(47.836304, 27.163436),
      LatLng(47.831147, 27.155348),
      LatLng(47.824360, 27.168692),
      LatLng(47.817843, 27.151709),
      LatLng(47.805352, 27.154135),
      LatLng(47.796660, 27.146452),
      LatLng(47.786608, 27.146048),
      LatLng(47.768537, 27.142611),
      LatLng(47.762150, 27.147665),
      LatLng(47.755626, 27.151709),
      LatLng(47.742825, 27.157474),
      LatLng(47.731500, 27.140901),
      LatLng(47.718554, 27.172175),
      LatLng(47.701827, 27.175383),
      LatLng(47.675556, 27.181531),
      LatLng(47.660436, 27.214408),
      LatLng(47.659716, 27.237931),
      LatLng(47.659896, 27.272145),
      LatLng(47.659716, 27.282837),
      LatLng(47.654314, 27.286044),
      LatLng(47.649633, 27.279095),
      LatLng(47.640629, 27.252632),
      LatLng(47.630759, 27.256201),
      LatLng(47.628470, 27.274405),
      LatLng(47.621111, 27.279662),
      LatLng(47.616477, 27.298667),
      LatLng(47.604755, 27.274809),
      LatLng(47.594666, 27.294624),
      LatLng(47.570922, 27.289479),
      LatLng(47.569367, 27.282954),
      LatLng(47.572228, 27.265232),
      LatLng(47.562417, 27.249328),
      LatLng(47.556693, 27.246753),
      LatLng(47.536552, 27.259628),
      LatLng(47.520545, 27.216398),
      LatLng(47.522015, 27.213648),
      LatLng(47.519833, 27.206379),//punct comun cu rediu
      LatLng(47.508012, 27.209563),
      LatLng(47.505884, 27.226538),
      LatLng(47.495835, 27.253313),
      LatLng(47.481053, 27.245788),
      LatLng(47.475140, 27.313048),//punct comun cu rediu
      LatLng(47.472255, 27.303370),
      LatLng(47.462222, 27.335174),
      LatLng(47.436413, 27.304077),
      LatLng(47.419678, 27.379701),
      //LatLng(47.421667, 27.398494),
      //LatLng(47.416058, 27.404559),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.411435, 27.407697),//punct comun cu rediu
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.349988, 27.377103),//punct comun cu rediu
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
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
      LatLng(47.012818, 27.238152),//pct iasi

      LatLng(47.012818, 27.238152),
      LatLng(47.027565, 27.252842),
      LatLng(47.032314, 27.297070),
      LatLng(47.056466, 27.335846),
      LatLng(47.080402, 27.346146),
      LatLng(47.061626, 27.365534),
      LatLng(47.065547, 27.380681),
      LatLng(47.065547, 27.393404),
      LatLng(47.071324, 27.405824),
      LatLng(47.086796, 27.401583),
      LatLng(47.096302, 27.410200),
      LatLng(47.101837, 27.445923),
      LatLng(47.094619, 27.472278),
      LatLng(47.096269, 27.495604),
      LatLng(47.083069, 27.503481),
      LatLng(47.090288, 27.507722),
      LatLng(47.093581, 27.536807),
      LatLng(47.111528, 27.540439),
      LatLng(47.113590, 27.550133),
      LatLng(47.110497, 27.566491),
      LatLng(47.137705, 27.574670),
      LatLng(47.139147, 27.588303),
      LatLng(47.136207, 27.606252),//pct iasi
      LatLng(47.144149, 27.581367),
      LatLng(47.151895, 27.567034),
      LatLng(47.150862, 27.564024),
      LatLng(47.159298, 27.553774),
      LatLng(47.162952, 27.551000),
      LatLng(47.172025, 27.528295),
      LatLng(47.182990, 27.498520),//pct rediu

      LatLng(47.186179, 27.488420),
      LatLng(47.192720, 27.477745),
      LatLng(47.204016, 27.434170),
      LatLng(47.213243, 27.387243),
      LatLng(47.234847, 27.369197),
      LatLng(47.238793, 27.349316),
      LatLng(47.254251, 27.333976),//rediu + belcesti
      LatLng(47.245227, 27.334454),
      LatLng(47.236959, 27.318040),
      LatLng(47.218622, 27.320688),
      LatLng(47.181568, 27.331277),
      LatLng(47.170411, 27.300038),

      LatLng(47.186202, 27.295618),
      LatLng(47.173070, 27.256080),
      LatLng(47.184601, 27.243660),

      LatLng(47.183529, 27.214596),
      LatLng(47.156990, 27.191148),
      LatLng(47.138468, 27.183939),
      LatLng(47.119395, 27.177531),
      LatLng(47.104131, 27.193550),
      LatLng(47.088863, 27.187944),
      LatLng(47.066226, 27.168720),
      LatLng(47.062679, 27.182337),
      LatLng(47.050674, 27.185541),
      LatLng(47.042760, 27.179133),
      LatLng(47.029931, 27.186342),
      LatLng(47.027747, 27.207568),
      LatLng(47.017645, 27.217981),
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
      LatLng(46.989657, 27.628765),//pct conum coline
      LatLng(47.065763, 27.664804),//pct comun coline
      //LatLng(),de jos in sus
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(46.933841, 27.768642),
      //LatLng(),sus in jos
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(46.922907, 27.816673),
      LatLng(46.953880, 27.828681),
      LatLng(47.046691, 27.776647),
      //LatLng(),de jos in sus
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.210111, 27.647366),
      //LatLng(),de jos in sus
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.238502, 27.623091),
      LatLng(47.237210, 27.611277),
      LatLng(47.212867, 27.600663),
      LatLng(47.225380, 27.589249),
      LatLng(47.210251, 27.567399),//punct comun prut
      LatLng(47.246797, 27.555171),
      LatLng(47.268413, 27.555346),
      LatLng(47.263545, 27.566721),
      LatLng(47.265801, 27.575646),
      LatLng(47.287290, 27.578226),
      LatLng(47.283119, 27.603352),
      LatLng(47.274415, 27.610836),
      LatLng(47.303691, 27.659410),//pct comun prut
      LatLng(47.309898, 27.679949),
      LatLng(47.298412, 27.680246),
      LatLng(47.293172, 27.691538),
      LatLng(47.300428, 27.706693),
      LatLng(47.295792, 27.726900),
      LatLng(47.286319, 27.738192),
      LatLng(47.277853, 27.747404),
      LatLng(47.271401, 27.747701),
      LatLng(47.263133, 27.747998),
      LatLng(47.258697, 27.758993),
      LatLng(47.252646, 27.756616),
      LatLng(47.247805, 27.756913),
      LatLng(47.240341, 27.758696),
      LatLng(47.236911, 27.758102),
      LatLng(47.231665, 27.764342),
      LatLng(47.231867, 27.774743),
      LatLng(47.226822, 27.775337),
      LatLng(47.221373, 27.779200),
      LatLng(47.219153, 27.786035),
      LatLng(47.213905, 27.785738),
      LatLng(47.209061, 27.786926),
      LatLng(47.207647, 27.791086),
      LatLng(47.190687, 27.786926),
      LatLng(47.188466, 27.795544),
      LatLng(47.191495, 27.800001),
      LatLng(47.189476, 27.804161),
      LatLng(47.172510, 27.796138),
      LatLng(47.168874, 27.800001),
      LatLng(47.166624, 27.811418),
      LatLng(47.152851, 27.803108),
      LatLng(47.143314, 27.800511),
      LatLng(47.139289, 27.828765),
      LatLng(47.136186, 27.841126),
      LatLng(47.127176, 27.852457),
      LatLng(47.123171, 27.844364),
      LatLng(47.127976, 27.842598),
      LatLng(47.127776, 27.837889),
      LatLng(47.122670, 27.826705),
      LatLng(47.116061, 27.833916),
      LatLng(47.112556, 27.858049),
      LatLng(47.109251, 27.854959),
      LatLng(47.104443, 27.858785),
      LatLng(47.104644, 27.863494),
      LatLng(47.107648, 27.863347),
      LatLng(47.107648, 27.876297),
      LatLng(47.103942, 27.872029),
      LatLng(47.099234, 27.884243),
      LatLng(47.092723, 27.879387),
      LatLng(47.090118, 27.882919),
      LatLng(47.091320, 27.888805),
      LatLng(47.085409, 27.896163),
      LatLng(47.074586, 27.896751),
      LatLng(47.073584, 27.900136),
      LatLng(47.077492, 27.906022),
      LatLng(47.069876, 27.914557),
      LatLng(47.068272, 27.919855),
      LatLng(47.062759, 27.932952),
      LatLng(47.066468, 27.938985),
      LatLng(47.060954, 27.945018),
      LatLng(47.057847, 27.959292),
      LatLng(47.053736, 27.956938),
      LatLng(47.053736, 27.956938),
      LatLng(47.054238, 27.952229),
      LatLng(47.051230, 27.945018),
      LatLng(47.047319, 27.952376),
      LatLng(47.049926, 27.963854),
      LatLng(47.047720, 27.964590),
      LatLng(47.046116, 27.958851),
      LatLng(47.043709, 27.958704),
      LatLng(47.043509, 27.961205),
      LatLng(47.044512, 27.974891),
      LatLng(47.039899, 27.976510),
      LatLng(47.035085, 27.986369),
      LatLng(47.038896, 27.990048),
      LatLng(47.034985, 27.996228),
      LatLng(47.029869, 27.994463),
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
            // LatLng(47.034784, 27.985045),
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
    List<LatLng> siretMoldova = [//+ceas
      LatLng(47.351768, 26.616604),
      LatLng(47.361607, 26.678770),
      LatLng(47.414663, 26.680145),
      LatLng(47.366884, 26.724140),
      LatLng(47.408439, 27.061569),
      LatLng(47.308935, 27.019922),//coum belcesti
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
      LatLng(47.254251, 27.333976),//belcesti+stejari
      LatLng(47.424405, 27.226946),
      LatLng(47.467589, 27.079803),
      LatLng(47.515649, 27.076713),
      LatLng(47.551382, 27.098632),
      LatLng(47.519833, 27.206379),//comun prut
      LatLng(47.508012, 27.209563),
      LatLng(47.505884, 27.226538),
      LatLng(47.495835, 27.253313),
      LatLng(47.481053, 27.245788),
      LatLng(47.475140, 27.313048),//comun prut
      LatLng(47.472255, 27.303370),
      LatLng(47.462222, 27.335174),
      LatLng(47.436413, 27.304077),
      LatLng(47.419678, 27.379701),
      LatLng(47.411435, 27.407697),//comun prut
      LatLng(47.349988, 27.377103),//comun prut
      LatLng(47.179577, 27.524507),
      LatLng(47.182990, 27.498520),
      LatLng(47.186179, 27.488420),
      LatLng(47.192720, 27.477745),
      LatLng(47.204016, 27.434170),
      LatLng(47.213243, 27.387243),
      LatLng(47.234847, 27.369197),
      LatLng(47.238793, 27.349316),
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
    List<LatLng> belcestiFocuri = [//-ceas
      LatLng(47.415205, 26.678717),//fa comun cu siret
      LatLng(47.368396, 26.727727),//fa comun cu siret
      LatLng(47.402231, 27.058105),//fa comun cu siret
      LatLng(47.308935, 27.019922),// /comun cu siret
      LatLng(47.183529, 27.214596),
      LatLng(47.254251, 27.333976),//rediu+stejari
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.424405, 27.226946),//rediu
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.467589, 27.079803),//rediu
      LatLng(47.466963, 27.053891),
      LatLng(47.453824, 27.064071),
      LatLng(47.443185, 27.043711),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      LatLng(47.411434, 26.805196),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
      //LatLng(),
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
