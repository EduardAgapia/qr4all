import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/place/place.dart';
import '../../../../map.dart';

class UtilInfoScreen extends StatefulWidget {
  final List<Place> utilInfo;

  UtilInfoScreen({required this.utilInfo, Key? key}) : super(key: key);

  _UtilInfoScreenState createState() =>
      _UtilInfoScreenState(utilInfo: utilInfo);
}

class _UtilInfoScreenState extends State<UtilInfoScreen> {
  final List<Place> utilInfo;

  _UtilInfoScreenState({required this.utilInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Informatii utile"),// i18n
        automaticallyImplyLeading: false,
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
          children: List.generate(
            utilInfo.length,
            (index) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Color.fromARGB(0, 255, 255, 255),
                ),
                child: GestureDetector(
                  onTap: () {
                    MapUtils.openMap(utilInfo[index].latitude!.toDouble(),
                        utilInfo[index].longitude!.toDouble());
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 155, 0, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        image: DecorationImage(
                            image: AssetImage(utilInfo[index].image.toString()),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                      width: double.infinity,
                      height: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(utilInfo[index].type.toString()),
                      ),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Color.fromARGB(200, 255, 255, 255)),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
