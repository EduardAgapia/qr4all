import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/scanner.dart';
import 'package:qr_4_all/domain/objective/objective.dart';

import '../../../../../map.dart';
import '../../google_map.dart';

class ObjectiveScreen extends StatefulWidget {
  final Objective objective;
  ObjectiveScreen({required this.objective, Key? key}) : super(key: key);

  _ObjectiveScreenState createState() => _ObjectiveScreenState(objective: objective);
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
  final Objective objective;
  _ObjectiveScreenState({required this.objective});

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
                  image: AssetImage("assets/gals/icons/obj.png"),
                  fit: BoxFit.cover),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height / 11.4,
                    width: MediaQuery.of(context).size.width - 20,//nu e bagat in seama
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(150, 0, 143, 105),
                    ),
                    child: Column(children: <Widget>[
                      ListTile(
                        title: Text(
                          objective.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          objective.programm.toString(),
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
                  const SizedBox(height: 60),
                  Container(
                    height: MediaQuery.of(context).size.height / 11.4,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(150, 0, 143, 105),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        MapUtils.openMap(47.152177, 27.585772);
                      },
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          const SizedBox(width: 10),
                          Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width / 11,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/gals/icons/arrow.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              objective.location.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      width: MediaQuery.of(context).size.width - 20,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(150, 0, 143, 105),
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
                              objective.description.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration:  const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)),
                              color: Color.fromARGB(0, 0, 143, 105),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const QRViewExample(),
                                  ),
                                );
                              },
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      " Afla povestea",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 19,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Container(
                                    width: 75,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/gals/icons/qr.png"),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
