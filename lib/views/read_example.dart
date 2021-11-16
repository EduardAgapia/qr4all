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
        centerTitle: true,
        title: const Text("Zone Turistice"),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 6 / 10,
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 60),
          //Todo: dynamic values with respect for phone specs
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
              //Todo: dynamic values with respect for phone specs
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(100, 255, 255, 255),
                ),
                alignment: Alignment.bottomCenter,
                child: const Align(
                  alignment: Alignment.center,
                  child: Text("Belcesti-Focuri"),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover)),
            ),
          ],
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
