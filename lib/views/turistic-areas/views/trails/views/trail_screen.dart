import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/domain/trail.dart';
import 'package:qr_4_all/views/turistic-areas/views/dummy_map.dart';

class TrailScreen extends StatefulWidget {
  final Trail trail;

  TrailScreen({required this.trail, Key? key}) : super(key: key);

  _TrailScreenState createState() => _TrailScreenState(trail: trail);
}

class _TrailScreenState extends State<TrailScreen> {
  final Trail trail;

  _TrailScreenState({required this.trail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              image: DecorationImage(
                  image: AssetImage("assets/gals/trail.png"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(100, 0, 143, 105),
                  ),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text(
                        '\n' + trail.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        trail.programm.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 120),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 25),
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(100, 0, 143, 105),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: const Text(
                            '\n Descriere \n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            trail.description.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                        Flexible(
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                const SizedBox(width: 10),
                                Container(
                                  height: 60,
                                  width:
                                      MediaQuery.of(context).size.width / 2.18,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                    color: Color.fromARGB(230, 0, 143, 105),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dummy(),
                                        ),
                                      );
                                    },
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        const SizedBox(height: 20),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                           trail.location.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          width: 70,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/gals/icons/arrow.png"),
                                                fit: BoxFit.fill),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.18,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25.0)),
                                    color: Color.fromARGB(230, 0, 143, 105),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Dummy(),
                                        ),
                                      );
                                    },
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: const [
                                        SizedBox(height: 20),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "  Descarca harta traseului",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   width: 75,
                                        //   decoration: const BoxDecoration(
                                        //     image: DecorationImage(
                                        //         image: AssetImage(
                                        //             "assets/gals/icons/qr.png"),
                                        //         fit: BoxFit.fill),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
