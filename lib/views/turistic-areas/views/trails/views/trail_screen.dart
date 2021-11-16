import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';

class TrailScreen extends StatefulWidget {
  _TrailScreenState createState() => _TrailScreenState();
}

class _TrailScreenState extends State<TrailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Trail Presentation Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Aici sunt detalii despre traseu"),
          ],
        ),
      ),
    );
  }
}
