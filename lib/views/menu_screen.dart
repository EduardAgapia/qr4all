import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Gal> galList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    setState(() {
      galList = Gal.performSingleFetch();
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
              title: const Text('Meniul principal'),
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
        body: const GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition:
              CameraPosition(target: LatLng(47.157116, 27.586520), zoom: 9),
        ),
      ),
    );
  }
}
