import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/domain/trail.dart';
import 'package:qr_4_all/views/turistic-areas/views/trails/views/trail_screen.dart';

class TrailsScreen extends StatefulWidget {
  final List<Trail> trails;
  TrailsScreen({required this.trails, Key? key}) : super(key: key);

  _TrailsScreenState createState() => _TrailsScreenState(trails: trails);
}

class _TrailsScreenState extends State<TrailsScreen> {
  final List<Trail> trails;

  _TrailsScreenState({required this.trails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista Trasee"),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 350 / 100,
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 5),
          //Todo: dynamic values with respect for phone specs
          crossAxisSpacing: 5,
          mainAxisSpacing: 15,
          crossAxisCount: 1,
          children: <Widget>[
            Container(
              //Todo: dynamic values with respect for phone specs
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightGreen.withOpacity(0.7),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                color: const Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrailScreen(trail: trails[0]),
                      ));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.lightGreen,
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.black,
                          image: DecorationImage(
                              image: AssetImage("assets/gals/trails.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          trails[0].name.toString() +
                              "\n" +
                              trails[0].programm.toString(),
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.lightGreen,
                          image: DecorationImage(
                              image: AssetImage("assets/gals/icons/qr.png"),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
