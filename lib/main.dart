import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/views/menu_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'QR4ALL app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.green,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<Home> {
  initState() {
    Timer(const Duration(seconds: 1), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gals/anotherDeal.png"),
                fit: BoxFit.cover)),
        child: const Align(
          alignment: Alignment.center,
          child: Text(
            "QR4ALL",
            style: TextStyle(
              color: Colors.black,
              fontSize: 55,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  void onClose() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
        maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => MenuScreen(),
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, anim1, anim2, child) {
          return FadeTransition(
            child: child,
            opacity: anim1,
          );
        }));
  }
}
