import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../../../map.dart';

class AboutScreen extends StatefulWidget {
  final Gal gal;

  AboutScreen({required this.gal, Key? key}) : super(key: key);

  _AboutScreenState createState() => _AboutScreenState(gal: gal);
}

class _AboutScreenState extends State<AboutScreen> {
  final Gal gal;

  _AboutScreenState({required this.gal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
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
                  image: AssetImage("assets/gals/iasi.png"), fit: BoxFit.cover),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
              width: double.infinity,
              height: 2,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  gal.name.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(200, 255, 255, 255)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width - 25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.white,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(47.152177, 27.585772);
                  },
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/hospital.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(47.152177, 27.585772);
                  },
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/insta.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(47.152177, 27.585772);
                  },
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/arrow.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(47.152177, 27.585772);
                  },
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/mech.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    MapUtils.openMap(47.152177, 27.585772);
                  },
                  child: Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/gals/icons/www.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width - 20,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              color: Colors.lightGreen,
            ),
            child: Column(children: <Widget>[
              ListTile(
                title: Text(
                  '\n' + AppLocalizations.of(context).placeholder + '\n',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                subtitle: Text(
                  gal.description.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 10),
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
                    '\n' + AppLocalizations.of(context).placeholder + '\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    gal.description.toString(),
                    style: const TextStyle(
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
