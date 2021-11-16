import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/calendar/views/event_screen.dart';

class CalendarScreen extends StatefulWidget {
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Calendar Electronic"),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 390 / 100,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          //Todo: dynamic values with respect for phone specs
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
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
                        builder: (context) => EventScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5/2),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("InitialEvent"),
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
                        builder: (context) => CalendarScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5/2),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Event1"),
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
                        builder: (context) => EventScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5/2),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Event2"),
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
                        builder: (context) => EventScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5/2),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Event3"),
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
                        builder: (context) => EventScreen(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 75, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/iasi.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5/2),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Event4"),
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
