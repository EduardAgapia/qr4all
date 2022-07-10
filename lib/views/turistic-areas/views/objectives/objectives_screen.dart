import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/objective/objective.dart';
import 'package:qr_4_all/views/turistic-areas/views/objectives/views/objective_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ObjectivesScreen extends StatefulWidget {
  final List<Objective> objectives;

  ObjectivesScreen({required this.objectives, Key? key}) : super(key: key);

  _ObjectivesScreenState createState() =>
      _ObjectivesScreenState(objectives: objectives);
}

class _ObjectivesScreenState extends State<ObjectivesScreen> {
  final List<Objective> objectives;
  late WebViewController controller;

  _ObjectivesScreenState({required this.objectives});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations
              .of(context)
              .objectives),
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
          initialUrl: 'https://eduardagapia.github.io/WoWEvents/ro/iasi/objs.html',
          javascriptMode: JavascriptMode.unrestricted,
          backgroundColor: Colors.white,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        )
    );
  }

    //   Column(
    //     children: <Widget>[
    //       Flexible(
    //         child: GridView.count(
    //           primary: false,
    //           childAspectRatio: 39 / 10,
    //           padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    //           //Todo: dynamic values with respect for phone specs
    //           mainAxisSpacing: 10,
    //           crossAxisCount: 1,
    //           children: List.generate(objectives.length, (index) {
    //             return GestureDetector(
    //               onTap: () {
    //                 Navigator.push(
    //                   context,
    //                   MaterialPageRoute(
    //                     builder: (context) => ObjectiveScreen(objective: objectives[index]),
    //                   ),
    //                 );
    //               },
    //               child: Container(
    //                 child: ListView(
    //                   scrollDirection: Axis.horizontal,
    //                   children: <Widget>[
    //                     Container(
    //                       width: MediaQuery.of(context).size.width / 5,
    //                       decoration: const BoxDecoration(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(15.0)),
    //                         color: Colors.black,
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/gals/objs.png"),
    //                             fit: BoxFit.cover),
    //                       ),
    //                     ),
    //                     const SizedBox(width: 15),
    //                     Align(
    //                       alignment: Alignment.center,
    //                       child: Text(
    //                         objectives[index].name.toString() +
    //                             "\n" +
    //                             objectives[index].program.toString() +
    //                             "\n" +
    //                             objectives[index].location.toString(),
    //                         style: TextStyle(
    //                           color: Colors.black,
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: MediaQuery.of(context).size.width / 26,
    //                         ),
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: MediaQuery.of(context).size.width/40,
    //                     ),
    //                     Container(
    //                       width: MediaQuery.of(context).size.width / 8,
    //                       decoration: const BoxDecoration(
    //                         borderRadius:
    //                             BorderRadius.all(Radius.circular(15.0)),
    //                         color: Colors.lightGreen,
    //                         image: DecorationImage(
    //                             image: AssetImage("assets/gals/icons/qr.png"),
    //                             fit: BoxFit.contain),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 decoration: BoxDecoration(
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.lightGreen.withOpacity(0.7),
    //                         spreadRadius: 2,
    //                         blurRadius: 5,
    //                         offset: const Offset(0, 5),
    //                       ),
    //                     ],
    //                     borderRadius:
    //                         const BorderRadius.all(Radius.circular(15.0)),
    //                     color: Colors.lightGreen),
    //               ),
    //             );
    //           }),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  // }
}
