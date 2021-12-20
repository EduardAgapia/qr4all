import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/trail/trail.dart';
import 'package:qr_4_all/views/storage.dart';
import '../../../../../map.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrailScreen extends StatefulWidget {
  final Trail trail;

  TrailScreen({required this.trail, Key? key}) : super(key: key);

  _TrailScreenState createState() => _TrailScreenState(trail: trail);
}

class _TrailScreenState extends State<TrailScreen> {
  final Trail trail;

  _TrailScreenState({required this.trail});

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
                  image: AssetImage("assets/gals/trail.png"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: [
                const SizedBox(height: 50),
                Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(100, 0, 143, 105),
                  ),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text(
                        '\n' + trail.name.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        trail.program.toString(),
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
                const SizedBox(height: 120),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 25),
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(100, 0, 143, 105),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            '\n' +
                                AppLocalizations.of(context).description +
                                '\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            trail.description.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Align(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  const SizedBox(width: 90),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        MapUtils.openMap(47.152177, 27.585772);
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/gals/icons/arrow.png"),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 33),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 6,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        MapUtils.open();
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/gals/icons/map.png"),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 33),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 7,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        MapUtils.download(
                                            FirebaseApi.download('/test.kml'));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/gals/icons/download.png"),
                                              fit: BoxFit.contain),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
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
