import 'package:url_launcher/url_launcher.dart';

class MapUtils {

  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
  static Future<void> open() async {
    String googleUrl = 'https://www.google.com/maps/d/u/0/edit?mid=1vQOroiUuS57KLP20_3XHXfc9Ms8ZpAKL&ll=47.151575562802066%2C27.582714629360964&z=18';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open';
    }
  }
}