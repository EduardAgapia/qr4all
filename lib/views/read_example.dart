import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';

class ReadExamples extends StatefulWidget {
  _ReadExampleState createState() => _ReadExampleState();
}

class _ReadExampleState extends State<ReadExamples> {
  String _displayText = 'Result go here';
  final _database = FirebaseDatabase.instance.reference();

  // late StreamSubscription _dailySpecialStream;

  @override
  void initState() {
    super.initState();
    // _acivateListeners();
    _performSingleFetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read examples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(_displayText),
            ],
          ),
        ),
      ),
    );
  }

  // void _acivateListeners() {
  //   _dailySpecialStream =
  //       _database.child("dailySpecial").onValue.listen((event) {
  //     final data = new Map<String, dynamic>.from(event.snapshot.value);
  //     final dailySpecial = DailySpecial.fromRTDB(data);
  //
  //     setState(() {
  //       _displayText = dailySpecial.fancyDescription();
  //     });
  //   });
  // }

  @override
  void deactivate() {
    // _dailySpecialStream.cancel();
    super.deactivate();
  }

  List<Gal> _performSingleFetch() {
    List<Gal> galList = List.empty(growable: true);
    galList.add(galProcessing('belcesti-focuri'));
    galList.add(galProcessing('codrii-pascanilor'));
    galList.add(galProcessing('colinele-iasului'));
    galList.add(galProcessing('dealurile-bohotinului'));
    galList.add(galProcessing('rediu-prajeni'));
    galList.add(galProcessing('siret-moldova'));
    galList.add(galProcessing('stefan-cel-mare'));
    galList.add(galProcessing('stejarii-argintii'));
    galList.add(galProcessing('valuea-prutului'));
    return galList;
  }

  Gal galProcessing(String galName) {
    Gal gal = Gal();
    _database.child(galName).get().then((snapshot) {
      final data = Map<String, dynamic>.from(snapshot!.value);
      final gal = Gal.fromRTDB(data);
      setState(() {
        _displayText += gal.fancyDescription();
      });
    });
    return gal;
  }
}
