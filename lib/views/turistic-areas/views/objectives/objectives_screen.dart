import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/views/objective_screen.dart';

class ObjectivesScreen extends StatefulWidget {
  _ObjectivesScreenState createState() => _ObjectivesScreenState();
}

class _ObjectivesScreenState extends State<ObjectivesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista Obiective"),
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
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiectivul Strengarului"),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ),
              ),
            ),
            Container(
              //Todo: dynamic values with respect for phone specs
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiectivul imaginar"),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ),
              ),
            ),
            Container(
              //Todo: dynamic values with respect for phone specs
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiectivul nemarginit"),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ),
              ),
            ),
            Container(
              //Todo: dynamic values with respect for phone specs
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiectivul necugetatului"),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ),
              ),
            ),
            Container(
              //Todo: dynamic values with respect for phone specs
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiectiv K"),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
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
