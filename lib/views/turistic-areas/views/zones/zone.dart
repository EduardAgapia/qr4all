import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/about_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/calendar/calendar_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/info/util_info_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/objectives_screen.dart';
import 'package:qr_4_all/views/turistic-areas/views/trails/trails_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutScreen(gal: gal),
                  ));
            },
            child: Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  color: Colors.lightGreen,
                  image: DecorationImage(
                      image: AssetImage("assets/gals/iasi.png"),
                      fit: BoxFit.cover),
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
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CalendarScreen(events: gal.events),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).calendar,
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
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TrailsScreen(trails: gal.trails),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).trails,
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
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ObjectivesScreen(objectives: gal.objectives),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).objectives,
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
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UtilInfoScreen(utilInfo: gal.utils),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).infoDetails,
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
                ///////////////////////////////////////////////////////////////////////////////////////////////

                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).recreation,
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

                //

                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).accommodation,
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

                ///////

                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ));
                    },
                    child: Container(
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

                /////

                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).producers,
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

                //////

                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(0, 255, 255, 255),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Placeholder(),
                          ));
                    },
                    child: Container(
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
                              AppLocalizations.of(context).legends,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
