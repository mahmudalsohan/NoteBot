import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OpenWebView extends StatefulWidget {
  final String title;
  final String url;
  const OpenWebView({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  _OpenWebViewState createState() => _OpenWebViewState();
}

class _OpenWebViewState extends State<OpenWebView> {
  late WebViewController controller;
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: [
              IconButton(
                onPressed: () async {
                  if (await controller.canGoBack()) {
                    controller.goBack();
                  }
                },
                icon: Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: () {
                  controller.reload();
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
          body: Column(
            children: [
              LinearProgressIndicator(
                value: progress,
                color: Colors.green,
                backgroundColor: Colors.white,
              ),
              Expanded(
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: widget.url,
                  onWebViewCreated: (controller) {
                    this.controller = controller;
                  },
                  onProgress: (progress) =>
                      setState(() => this.progress = progress / 100),
                ),
              ),
            ],
          ),
        ),
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          }
          return true;
        });
  }
}
