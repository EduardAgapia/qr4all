import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_4_all/domain/event/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CalendarScreen extends StatefulWidget {
  final List<Evenimente> events;
  final String language;
  final String galCode;

  const CalendarScreen({required this.events, required this.language, required this.galCode, Key? key}) : super(key: key);

  _CalendarScreenState createState() => _CalendarScreenState(events: events, language: language, galCode: galCode);
}

class _CalendarScreenState extends State<CalendarScreen> {
  final List<Evenimente> events;
  final String language;
  final String galCode;
  late WebViewController controller;

  _CalendarScreenState({required this.events, required this.language, required this.galCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations
              .of(context)
              .calendar),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () async{
                if (await controller.canGoBack()) {
                  controller.goBack();
                } else {
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body:
        WebView(
          initialUrl: 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/calendar.html',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          backgroundColor: Colors.white,
        )
    );
  }

      // Column(
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
      //       height: MediaQuery.of(context).size.height / 3.6,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: const BoxDecoration(
      //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
      //         color: Colors.lightGreen,
      //         image: DecorationImage(
      //             image: AssetImage("assets/gals/events.png"),
      //             fit: BoxFit.cover),
      //       ),
      //     ),
      //     const SizedBox(height: 15),
      //     Flexible(
      //       child: GridView.count(
      //         primary: false,
      //         childAspectRatio: 39 / 10,
      //         padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      //         //Todo: dynamic values with respect for phone specs
      //         mainAxisSpacing: 10,
      //         crossAxisCount: 1,
      //         children: List.generate(events.length, (index) {
      //           return GestureDetector(
      //             onTap: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => EventScreen(event: events[index]),
      //                 ),
      //               );
      //             },
      //             child: Container(
      //               child: ListView(
      //                 scrollDirection: Axis.horizontal,
      //                 children: <Widget>[
      //                   Container(
      //                     height: 75,
      //                     width: 75,
      //                     decoration: const BoxDecoration(
      //                       borderRadius:
      //                           BorderRadius.all(Radius.circular(15.0)),
      //                       color: Colors.black,
      //                       image: DecorationImage(
      //                           image: AssetImage("assets/gals/events.png"),
      //                           fit: BoxFit.cover),
      //                     ),
      //                   ),
      //                   const SizedBox(width: 15),
      //                   Align(
      //                     alignment: Alignment.center,
      //                     child: Text(
      //                       events[index].name.toString() +
      //                           "\n" +
      //                           events[index].program.toString() +
      //                           "\n" +
      //                           events[index].location.toString(),
      //                       style: const TextStyle(
      //                         color: Colors.black,
      //                         fontWeight: FontWeight.w600,
      //                         fontSize: 12,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               decoration: BoxDecoration(
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.lightGreen.withOpacity(0.7),
      //                       spreadRadius: 2,
      //                       blurRadius: 5,
      //                       offset: const Offset(0, 5),
      //                     ),
      //                   ],
      //                   borderRadius:
      //                       const BorderRadius.all(Radius.circular(15.0)),
      //                   color: Colors.lightGreen),
      //             ),
      //           );
      //         }),
      //       ),
      //     )
      //   ],
      // ),
  //   );
  // }
}
