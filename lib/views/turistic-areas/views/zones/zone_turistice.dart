import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ZoneTuristice extends StatefulWidget {
  final List<Gal> galList;

  const ZoneTuristice({required this.galList, Key? key}) : super(key: key);

  @override
  _ReadExampleState createState() => _ReadExampleState(galList: galList);
}

class _ReadExampleState extends State<ZoneTuristice> {
  final List<Gal> galList;

  _ReadExampleState({required this.galList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).turisticAreas),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          childAspectRatio: 6 / 10,
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 60),
          //Todo: dynamic values with respect for phone specs
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
          crossAxisCount: 3,
          children: List.generate(galList.length, (index) {
            return Container(
              //Todo: dynamic values with respect for phone specs
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text(AppLocalizations.of(context).to +
                                ' ' +
                                galList[index].name.toString()),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ZoneScreen(gal: galList[index]),
                                  ));
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.dangerous),
                            title:
                                Text(AppLocalizations.of(context).placeholder),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Placeholder(),
                                ),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.dangerous),
                            title:
                                Text(AppLocalizations.of(context).placeholder),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Placeholder(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage(galList[index].imgSrc.toString()),
                          fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(2, 0, 0, 4),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 30,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          galList[index].name.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height / 53,
                          ),
                        ),
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0)),
                          color: Color.fromARGB(200, 255, 255, 255)),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
