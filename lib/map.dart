import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
     String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude'; //just for poc
    // String googleUrl = 'https://eduardagapia.github.io/WoWEvents/team.html';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl, forceSafariVC: true, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not open the map.';
    }
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