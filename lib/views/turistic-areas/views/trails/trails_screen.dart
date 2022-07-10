import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_4_all/domain/trail/trail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TrailsScreen extends StatefulWidget {
  final List<Trail> trails;
  final String language;
  final String galCode;

  TrailsScreen({required this.trails, required this.language,required this.galCode, Key? key}) : super(key: key);

  get paymentUrl => 'https://eduardagapia.github.io/WoWEvents/'+ language +'/'+ galCode +'/trails.html';

  _TrailsScreenState createState() => _TrailsScreenState(trails: trails, language: language, galCode: galCode);
}

class _TrailsScreenState extends State<TrailsScreen> {
  final List<Trail> trails;
  final String language;
  final String galCode;
  late WebViewController controller;

  Future<void> _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, enableJavaScript: true, forceSafariVC: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _TrailsScreenState({required this.trails, required this.language, required this.galCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppLocalizations
              .of(context)
              .trailList),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () async {
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
          initialUrl: widget.paymentUrl,
          javascriptMode: JavascriptMode.unrestricted,
          backgroundColor: Colors.white,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(RegExp('^intent://.*\$'))) {
              return NavigationDecision.prevent;
            } else if (request.url.startsWith("https://www.google.ro/maps/dir")) {
            _launchURL(request.url);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        )
    );
  }
//
//
// Column(
//   children: <Widget>[
//     Flexible(
//       child: GridView.count(
//         primary: false,
//         childAspectRatio: 39 / 10,
//         padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//         //Todo: dynamic values with respect for phone specs
//         mainAxisSpacing: 10,
//         crossAxisCount: 1,
//         children: List.generate(trails.length, (index) {
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TrailScreen(trail: trails[index]),
//                 ),
//               );
//             },
//             child: Container(
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width / 5,
//                     decoration: const BoxDecoration(
//                       borderRadius:
//                           BorderRadius.all(Radius.circular(15.0)),
//                       color: Colors.black,
//                       image: DecorationImage(
//                           image: AssetImage("assets/gals/trails.png"),
//                           fit: BoxFit.cover),
//                     ),
//                   ),
//                   const SizedBox(width: 15),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Text(
//                       trails[index].name.toString() +
//                           "\n" +
//                           trails[index].program.toString() +
//                           "\n" +
//                           trails[index].location.toString(),
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: MediaQuery.of(context).size.width / 26,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: MediaQuery.of(context).size.width/40),
//                   Container(
//                     width: MediaQuery.of(context).size.width / 8,
//                     decoration: const BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                       color: Colors.lightGreen,
//                       image: DecorationImage(
//                           image: AssetImage("assets/gals/icons/qr.png"),
//                           fit: BoxFit.contain),
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

}
