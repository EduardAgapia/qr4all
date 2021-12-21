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
  late String mapUrl;

  @override
  initState() {
    super.initState();
    FirebaseApi.download(trail.mapDownloadUrl.toString())
        .then((value) => setState(() {
              mapUrl = value;
            }));
  }

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
                SizedBox(height: MediaQuery.of(context).size.height / 30),
                Container(
                  height: MediaQuery.of(context).size.height / 6.66666,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Color.fromARGB(100, 0, 143, 105),
                  ),
                  child: Column(children: <Widget>[
                    ListTile(
                      title: Text(
                        '\n' +
                        trail.name.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Text(
                        trail.program.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 35,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 13),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                    height: MediaQuery.of(context).size.height / 1.65,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Color.fromARGB(100, 0, 143, 105),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            AppLocalizations.of(context).description + '\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height / 35,
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            trail.description.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.height / 45,
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 50),
                        Align(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 11,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width /
                                              3.2),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 13,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        MapUtils.openMap(
                                            trail.latitude!.toDouble(),
                                            trail.longitude!.toDouble());
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
                                  SizedBox(width: MediaQuery.of(context).size.width / 25),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8.5,
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
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width / 25),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 10.5,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25.0)),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        MapUtils.download(mapUrl);
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
