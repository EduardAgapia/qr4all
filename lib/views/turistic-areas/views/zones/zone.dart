import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/about_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/calendar/calendar_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/info/util_info_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/objectives_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/trails/trails_screen.dart';

class ZoneScreen extends StatefulWidget {
  final Gal gal;
  ZoneScreen({required this.gal, Key? key}) : super(key: key);

  @override
  _ZoneScreenState createState() => _ZoneScreenState(gal: gal);
}

class _ZoneScreenState extends State<ZoneScreen> {
  final Gal gal;
  _ZoneScreenState({required this.gal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(gal.name.toString()),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 265 / 100,
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
                        builder: (context) => AboutScreen(gal: gal),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
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
                      child: Text("Despre"),
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
                        builder: (context) => CalendarScreen(events: gal.events),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/events.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Calendar Electronic"),
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
                        builder: (context) => TrailsScreen(trails: gal.trails),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/trails.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Trasee"),
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
                        builder: (context) => ObjectivesScreen(objectives: gal.objectives),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/objs.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Obiective Turistice"),
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
                        builder: (context) => UtilInfoScreen(utilInfo: gal.utils),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 115, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/infos.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Informatii utile"),
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
