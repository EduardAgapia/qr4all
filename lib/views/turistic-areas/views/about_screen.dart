import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';

class AboutScreen extends StatefulWidget {
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("About Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Aici sunt detalii despre gal"),
          ],
        ),
      ),
    );
  }
}