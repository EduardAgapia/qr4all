import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WriteExamples extends StatefulWidget {
  _WriteExampleState createState() => _WriteExampleState();
}

class _WriteExampleState extends State<WriteExamples> {
  final dataBase = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final dailySpecial = dataBase.child('dailySpecial');

    return Scaffold(
      appBar: AppBar(
        title: Text("Write examples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    dailySpecial.set({
                      'description': 'Vanilla latte',
                      'price': 4.99
                    }).then((_) => print("special has been written!"));
                  },
                  child: Text("Simple set"))
            ],
          ),
        ),
      ),
    );
  }
}
