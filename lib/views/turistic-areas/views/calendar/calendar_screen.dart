import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/calendar/views/event_screen.dart';

class CalendarScreen extends StatefulWidget {
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            height: MediaQuery.of(context).size.height / 3.6,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.lightGreen,
              image: DecorationImage(
                  image: AssetImage("assets/gals/events.png"),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: GridView.count(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              //Todo: dynamic values with respect for phone specs
              childAspectRatio: MediaQuery.of(context).size.height / 161,
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
              //ToDo: Make it dynamic and delete all that is under








                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventScreen(),
                      ),
                    );
                  },
                  child: Container(
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
                                image: AssetImage("assets/gals/events.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            " NUME eveniment \n PROGRAM eveniment \n LOCATIE eveniment",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        color: Colors.lightGreen),
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
