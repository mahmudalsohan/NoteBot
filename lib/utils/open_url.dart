import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future openUrl({required String? url}) => _launchUrl(url!);

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Can not launch url!!!!!!");
    }
  }
}
