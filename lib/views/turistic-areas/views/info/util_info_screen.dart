import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/util_info.dart';
import 'package:qr_4_all/views/turistic-areas/views/dummy_map.dart';

class UtilInfoScreen extends StatefulWidget {
  final UtilInfo utilInfo;
  UtilInfoScreen({required this.utilInfo, Key? key}) : super(key: key);
  _UtilInfoScreenState createState() => _UtilInfoScreenState(utilInfo: utilInfo);
}

class _UtilInfoScreenState extends State<UtilInfoScreen> {
  final UtilInfo utilInfo;
  _UtilInfoScreenState({required this.utilInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Informatii utile"),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 105 / 100,
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          //Todo: dynamic values with respect for phone specs
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/restaurant.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Restaurant"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/drugstore.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Farmacii"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/hotel.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Cazare"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/hospital.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Spital"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/hall.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Primarie"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/gas.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Benzinarie"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/police.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Politie"),
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
                        builder: (context) => const Dummy(),
                      ));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage("assets/gals/service.png"),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Service Auto"),
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
