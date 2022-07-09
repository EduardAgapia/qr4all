import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
     String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'; //just for poc
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not open the map.';
    }
  }
  static Future<void> openUrl(String page) async {
     String googleUrl = 'https://eduardagapia.github.io/WoWEvents/$page.html';
    // if (await canLaunch(googleUrl)) {
      WebView(
        initialUrl: googleUrl,
        javascriptMode: JavascriptMode.unrestricted,
        backgroundColor: Colors.white,
      );
      // await launch(googleUrl, forceWebView: true, enableJavaScript: true);
    // } else {
    //   throw 'Could not open the map.';
    // }
  }

  static Future<void> open(String mapUrl) async {
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      throw 'Could not open';
    }
  }
  static Future<void> download(String url) async {
    String googleUrl = url;
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open';
    }
  }
}