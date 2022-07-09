import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UtilInfoScreen extends StatefulWidget {
  final String title;
  final String url;

  UtilInfoScreen({required this.title, Key? key, required this.url})
      : super(key: key);

  _UtilInfoScreenState createState() =>
      _UtilInfoScreenState(title: title, url: url);
}

class _UtilInfoScreenState extends State<UtilInfoScreen> {
  final String title;
  final String url;
  late WebViewController controller;

  _UtilInfoScreenState({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
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
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          backgroundColor: Colors.white,
          onWebViewCreated: (controller) {
            this.controller = controller;
          },
        ));
  }

//     Center(
//       child: GridView.count(
//         primary: false,
//         childAspectRatio: 105 / 100,
//         padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
//         //Todo: dynamic values with respect for phone specs
//         crossAxisSpacing: 5,
//         mainAxisSpacing: 5,
//         crossAxisCount: 2,
//         children: List.generate(
//           utilInfo.length,
//           (index) {
//             return Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                 color: Color.fromARGB(0, 255, 255, 255),
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   MapUtils.openMap(utilInfo[index].latitude!.toDouble(),
//                       utilInfo[index].longitude!.toDouble());
//                 },
//                 child: Container(
//                   padding: EdgeInsets.fromLTRB(
//                       0,
//                       MediaQuery.of(context).size.height / 6,
//                       0,
//                       0),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                       image: DecorationImage(
//                           image: AssetImage(utilInfo[index].image.toString()),
//                           fit: BoxFit.cover)),
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(0, 0, 0, MediaQuery.of(context).size.height / 170),
//                     width: double.infinity,
//                     child: Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Text(utilInfo[index].type.toString(),
//                       style: TextStyle(fontSize: MediaQuery.of(context).size.height/27)),
//                     ),
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                         color: Color.fromARGB(200, 255, 255, 255)),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     ),
//   );
// }
}
