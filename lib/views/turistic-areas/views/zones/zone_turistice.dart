import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/views/turistic-areas/views/zones/zone.dart';

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
  void initState() {
    super.initState();
    // _acivateListeners();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint('check:');
    // debugPrint(Gal.galList.length.toString());
    // debugPrint('check:');
    // debugPrint(Gal.galList[0].name);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Zone Turistice"),
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
          children: List.generate(Gal.galList.length, (index) {
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
                              title: Text(
                                  'Catre ' + Gal.galList[index].name.toString()),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ZoneScreen(gal: Gal.galList[index]),
                                    ));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.dangerous),
                              title: Text('Placeholder'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Placeholder(),
                                    ));
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.dangerous),
                              title: Text('Placeholder'),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Placeholder(),
                                    ));
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 180, 0, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage(Gal.galList[index].imgSrc.toString()),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                    width: double.infinity,
                    height: 10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(Gal.galList[index].name.toString()),
                    ),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromARGB(200, 255, 255, 255)),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // void _acivateListeners() {
  //   _dailySpecialStream =
  //       _database.child("dailySpecial").onValue.listen((event) {
  //     final data = new Map<String, dynamic>.from(event.snapshot.value);
  //     final dailySpecial = DailySpecial.fromRTDB(data);
  //
  //     setState(() {
  //       _displayText = dailySpecial.fancyDescription();
  //     });
  //   });
  // }

}
