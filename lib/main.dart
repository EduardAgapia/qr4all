import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qr_4_all/views/menu_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/l10n.dart';

int? isviewed;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.green,
        ),
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: isviewed != 0 ? Home() : MenuScreen(isRo: true));
  }
}

class Home extends StatefulWidget {
  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<Home> {

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }
  initState() {
    // Timer(const Duration(seconds: 1), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        SizedBox(height: MediaQuery.of(context).size.height / 10),
        Container(
          child: Row(
            children: [
              SizedBox(width: 2 * MediaQuery.of(context).size.width / 7.5),
              GestureDetector(
                  onTap: () {
                    _storeOnboardInfo();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(isRo: true),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/gals/ro.png"),
                            fit: BoxFit.cover)),
                  )),
              SizedBox(width: MediaQuery.of(context).size.width / 5),
              GestureDetector(
                  onTap: () {
                    _storeOnboardInfo();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreen(isRo: false),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/gals/uk.png"),
                            fit: BoxFit.cover)),
                  ))
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/gals/anotherDeal.png"),
                  fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "\n"
              "QR4ALL",
              style: TextStyle(
                  color: const Color.fromARGB(255, 32, 54, 20),
                  fontSize: MediaQuery.of(context).size.width / 8.5,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 4.4,
          width: MediaQuery.of(context).size.width / 10,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/gals/first-screen-placeholder.png"),
                fit: BoxFit.cover),
          ),
        ),
      ]),
    );
  }

// void onClose() {
//   Navigator.of(context).pushReplacement(PageRouteBuilder(
//       maintainState: true,
//       opaque: true,
//       pageBuilder: (context, _, __) => MenuScreen(isRo: false),
//       transitionDuration: const Duration(milliseconds: 4000),
//       transitionsBuilder: (context, anim1, anim2, child) {
//         return FadeTransition(
//           child: child,
//           opacity: anim1,
//         );
//       }));
// }
}
