import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/scanner.dart';
import 'package:qr_4_all/domain/objective/objective.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../map.dart';

class ObjectiveScreen extends StatefulWidget {
  final Objective objective;

  ObjectiveScreen({required this.objective, Key? key}) : super(key: key);

  _ObjectiveScreenState createState() =>
      _ObjectiveScreenState(objective: objective);
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
                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Container(
                    height: MediaQuery.of(context).size.height / 6.6666,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(150, 0, 143, 105),
                    ),
                    child: Column(children: <Widget>[
                      ListTile(
                        title: Text(
                          '\n' + objective.name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 30,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        subtitle: Text(
                          objective.program.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height / 35,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 20),
                  Container(
                    height: MediaQuery.of(context).size.height / 11.4,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(150, 0, 143, 105),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        MapUtils.openMap(objective.latitude!.toDouble(),
                            objective.longitude!.toDouble());
                      },
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 50),
                          Container(
                            width: MediaQuery.of(context).size.width / 13,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/gals/icons/arrow.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 40),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              objective.location.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 45),
                  Flexible(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.8,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(150, 0, 143, 105),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              AppLocalizations.of(context).description + '\n',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 35,
                                fontWeight: FontWeight.w800,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            subtitle: Text(
                              objective.description.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.height / 45,
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 10,
                            width: MediaQuery.of(context).size.width,
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
                                    builder: (context) => const QRViewExample(),
                                  ),
                                );
                              },
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          75),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/gals/icons/qr.png"),
                                          fit: BoxFit.contain),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      AppLocalizations.of(context).find,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35,
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
            ),
          ),
        ],
      ),
    );
  }
}
