import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';

class Placeholder extends StatefulWidget {
  _PlaceholderState createState() => _PlaceholderState();
}

class _PlaceholderState extends State<Placeholder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Placeholder Screen"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/gals/wip.gif"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}