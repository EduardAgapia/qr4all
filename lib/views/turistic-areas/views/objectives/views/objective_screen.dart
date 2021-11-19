import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';

import '../../dummy_map.dart';

class ObjectiveScreen extends StatefulWidget {
  _ObjectiveScreenState createState() => _ObjectiveScreenState();
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
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
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height / 11.4,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(150, 0, 143, 105),
                  ),
                  child: Column(children: const <Widget>[
                    ListTile(
                      title: Text(
                        'Nume Traseu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        ' Program traseu',
                        style: TextStyle(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Dummy(),
                        ),
                      );
                    },
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 75,
                          width: 75,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Colors.black,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/gals/icons/arrow.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "LOCATIE Obiectiv",
                            style: TextStyle(
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
                        const ListTile(
                          title: Text(
                            '\n Descriere \n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                            'sed do eiusmod tempor incididunt ut labore et dolore '
                            'magna aliqua. Ut enim ad minim veniam, quis nostrud'
                            ' exercitation ullamco laboris nisi ut aliquip ex ea '
                            'commodo consequat. Duis aute irure dolor in reprehenderit '
                            'in voluptate velit esse cillum dolore eu fugiat nulla '
                            'pariatur. Excepteur sint occaecat cupidatat non proident,'
                            ' sunt in culpa qui officia deserunt mollit anim id est '
                            'laborum.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(height: 120),
                        Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25.0)),
                            color: Color.fromARGB(0, 0, 143, 105),
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
                                        fit: BoxFit.fill),
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
        ],
      ),
    );
  }
}
