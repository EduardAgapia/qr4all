import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/gal.dart';
import 'package:qr_4_all/domain/objective.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/views/objective_screen.dart';

class ObjectivesScreen extends StatefulWidget {
  final List<Objective> objectives;

  ObjectivesScreen({required this.objectives, Key? key}) : super(key: key);

  _ObjectivesScreenState createState() =>
      _ObjectivesScreenState(objectives: objectives);
}

class _ObjectivesScreenState extends State<ObjectivesScreen> {
  final List<Objective> objectives;

  _ObjectivesScreenState({required this.objectives});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Obiective turistice"),
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
              children: List.generate(objectives.length, (index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ObjectiveScreen(objective: objectives[index]),
                      ),
                    );
                  },
                  child: Container(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          height: 75,
                          width: 75,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/gals/objs.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            objectives[index].name.toString() +
                                "\n" +
                                objectives[index].programm.toString() +
                                "\n" +
                                objectives[index].location.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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
