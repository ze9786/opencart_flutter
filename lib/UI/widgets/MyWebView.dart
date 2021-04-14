import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  MyWebView({Key key, @required this.url}) : super(key: key);
  final String url;
  @override
  _MyWebViewState createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  WebViewController controller;
  @override
  void didUpdateWidget(covariant MyWebView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (widget.url != oldWidget.url) {
      setState(() {
        controller.loadUrl(widget.url);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        // _controller.complete(webViewController);
        controller = webViewController;
      },
    );
  }
}
