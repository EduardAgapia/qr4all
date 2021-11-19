import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone_turistice.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  _DummyScreenState createState() => _DummyScreenState();
}

class _DummyScreenState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gals/map.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
