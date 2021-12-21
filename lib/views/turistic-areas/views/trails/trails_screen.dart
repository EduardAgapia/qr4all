import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/trail/trail.dart';
import 'package:qr_4_all/views/turistic-areas/views/trails/views/trail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TrailsScreen extends StatefulWidget {
  final List<Trail> trails;

  TrailsScreen({required this.trails, Key? key}) : super(key: key);

  _TrailsScreenState createState() => _TrailsScreenState(trails: trails);
}

class _TrailsScreenState extends State<TrailsScreen> {
  final List<Trail> trails;

  _TrailsScreenState({required this.trails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).trailList),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView.count(
              primary: false,
              childAspectRatio: 39 / 10,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              //Todo: dynamic values with respect for phone specs
              mainAxisSpacing: 10,
              crossAxisCount: 1,
              children: List.generate(trails.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrailScreen(trail: trails[index]),
                      ),
                    );
                  },
                  child: Container(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/gals/trails.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            trails[index].name.toString() +
                                "\n" +
                                trails[index].program.toString() +
                                "\n" +
                                trails[index].location.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: MediaQuery.of(context).size.width / 26,
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width/40),
                        Container(
                          width: MediaQuery.of(context).size.width / 8,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            color: Colors.lightGreen,
                            image: DecorationImage(
                                image: AssetImage("assets/gals/icons/qr.png"),
                                fit: BoxFit.contain),
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        color: Colors.lightGreen),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
