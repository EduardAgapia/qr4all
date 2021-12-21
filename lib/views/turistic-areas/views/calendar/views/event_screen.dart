import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../map.dart';

class EventScreen extends StatefulWidget {
  final Evenimente event;

  const EventScreen({required this.event, Key? key}) : super(key: key);

  _EventScreenState createState() => _EventScreenState(event: event);
}

class _EventScreenState extends State<EventScreen> {
  final Evenimente event;

  _EventScreenState({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
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
              color: Colors.lightGreen,
              image: const DecorationImage(
                  image: AssetImage("assets/gals/events.png"),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 25,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    event.name.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(200, 255, 255, 255)),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width - 25,
            child: GestureDetector(
              onTap: () {
                MapUtils.openMap(
                    event.latitude!.toDouble(), event.longitude!.toDouble());
              },
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 11,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/arrow.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    width: MediaQuery.of(context).size.width / 99,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      event.location.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.lightGreen,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width - 25,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                const SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width / 11,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    image: DecorationImage(
                        image: AssetImage("assets/gals/icons/date.png"),
                        fit: BoxFit.scaleDown),
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: MediaQuery.of(context).size.width / 99,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    event.location.toString() + "\n" + event.program.toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.lightGreen,
            ),
          ),
          const SizedBox(height: 15),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width - 12,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                color: Colors.lightGreen,
              ),
              child: Column(children: <Widget>[
                ListTile(
                  title: Text(
                    '\n' + AppLocalizations.of(context).description + '\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    event.description.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
