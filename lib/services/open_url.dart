import 'package:butex_notebot/widgets/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future openUrl({
    required String? url,
    bool webView = false,
    required BuildContext context,
  }) =>
      _launchUrl(url!, webView, context);

  static Future _launchUrl(
      String url, bool webView, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: webView,
        enableJavaScript: webView,
        forceSafariVC: webView,
      );
    } else {
      customSnackBar(context,
          message: "Can not Launch !", bg: Color(0xffaf2031));
      print("Can not launch url!!!!!!");
    }
  }
}
