import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/about_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/calendar/calendar_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/info/util_info_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/objectives_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/trails/trails_screen.dart';

class ZoneScreen extends StatefulWidget {
  final Gal gal;
  final String language;
  final String galCode;

  ZoneScreen({required this.gal, required this.language, required this.galCode, Key? key}) : super(key: key);

  @override
  _ZoneScreenState createState() => _ZoneScreenState(gal: gal, language: language, galCode: galCode);
}

class _ZoneScreenState extends State<ZoneScreen> {
  final Gal gal;
  final String language;
  final String galCode;

  _ZoneScreenState({required this.gal, required this.language, required this.galCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                child: InkWell(
                  highlightColor: Colors.lightGreen.withOpacity(1.0),
                  child: Ink(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage(gal.imgSrc.toString()),
                          fit: BoxFit.fitHeight),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 30,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            gal.name.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.height / 40,
                            ),
                          ),
                        ),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Color.fromARGB(200, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: GridView.count(
                primary: false,
                childAspectRatio: 100 / 100,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            // MapUtils.openUrl("calendar");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CalendarScreen(events: gal.events, galCode: galCode,language: language),
                                ));
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/events.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Evenimente si festivaluri' : 'Local events',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            // MapUtils.openUrl("trails");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TrailsScreen(trails: gal.trails, galCode: galCode, language: language),
                                ));
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/trails.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Trasee' : 'Trails',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            // MapUtils.openUrl("objs");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ObjectivesScreen(objectives: gal.objectives, galCode: galCode, language: language),
                                ));
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/objs.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Obiective turistice' : 'Turistic Objectives',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Informatii utile' : 'Useful informations',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/infos.html'),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/infos.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Informatii utile' : 'Useful informations',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ///////////////////////////////////////////////////////////////////////////////////////////////

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Zone de Agrement' : 'Recreation',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/recreation.html'),
                              ),
                            );
                            // MapUtils.openUrl("recreation");
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/recreation.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Zone de agrement' : 'Recreation',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Cazare' : 'Accommodation',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/hotels.html'),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/hotel.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Cazare' : 'Accommodation',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  ///////

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Restaurante' : 'Restaurants',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/restaurants.html'),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/restaurant.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    AppLocalizations.of(context).restaurants,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /////

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Producatori locali' : 'Local producers',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/producers.html'),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/producers.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Producatori locali' : 'Local producers',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //////

                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(0, 255, 255, 255),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Material(
                        child: InkWell(
                          highlightColor: Colors.lightGreen.withOpacity(1.0),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UtilInfoScreen(
                                    title: language == 'ro' ? 'Legende si povesti' : 'Local fairy tales',
                                    url: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/legends.html'),
                              ),
                            );
                          },
                          child: Ink(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                image: DecorationImage(
                                    image: AssetImage("assets/gals/legends.png"),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height / 30,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    language == 'ro' ? 'Legende si povesti' : 'Local fairy tales',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.height / 40,
                                    ),
                                  ),
                                ),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color.fromARGB(200, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
