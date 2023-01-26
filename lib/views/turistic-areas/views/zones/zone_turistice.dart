import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZoneTuristice extends StatefulWidget {
  final List<Gal> galList;
  final String language;
  const ZoneTuristice({required this.galList,required this.language, Key? key}) : super(key: key);

  @override
  _ReadExampleState createState() => _ReadExampleState(galList: galList, language: language);
}

class _ReadExampleState extends State<ZoneTuristice> {
  final List<Gal> galList;
  final String language;

  String getGalCode(String? galName){
    switch(galName){
      case 'Belcesti-Focuri': return 'bf';
      case 'Codrii Pascanilor': return 'cp';
      case 'Dealurile Bohotinului': return 'db';
      case 'Rediu-Prajeni': return 'rp';
      case 'Siret-Moldova': return 'sm';
      case 'Stefan cel Mare': return 'scm';
      case 'Stejarii-Argintii': return 'sa';
      case 'Valuea Prutului': return 'vp';
      case 'Colinele Iasilor': return 'ci';
      default: return 'is';
    }
  }

  _ReadExampleState({required this.galList, required this.language});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 245, 216),
      appBar: AppBar(
        centerTitle: true,
        title: Text(language == 'ro' ? 'Zone Turistice' : 'Turistic Areas'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/gals/trail.png"),
            fit: BoxFit.cover
          )
        ),
        child: Center(
          child: GridView.count(
            primary: false,
            childAspectRatio: 6 / 10,
            padding: const EdgeInsets.fromLTRB(10, 50, 10, 60),
            //Todo: dynamic values with respect for phone specs
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            crossAxisCount: 3,
            children: List.generate(galList.length, (index) {
              return Container(
                //Todo: dynamic values with respect for phone specs
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    color: Colors.white.withOpacity(0.69),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoneScreen(
                                gal: galList[index],
                                galCode: getGalCode(galList[index].name),
                                language: language
                              ),
                            ));
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          color:Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            image: DecorationImage(
                                image: AssetImage(galList[index].imgSrc.toString()),
                                fit: BoxFit.fitWidth)),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(
                                0, 0, 0, MediaQuery.of(context).size.height / 150),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 30,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                galList[index].name.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: MediaQuery.of(context).size.height / 60,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15.0),
                                    bottomRight: Radius.circular(15.0)),
                                color: Colors.white.withOpacity(0.9)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
