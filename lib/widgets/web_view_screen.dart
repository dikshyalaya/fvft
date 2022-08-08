import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// ScreenWidget [WebViewScreen] : WebViewScreen used to display content of URL (Web page content) within a app
class WebViewScreen extends StatefulWidget {
  final String? appBarTitle;

  final String? urlToRender;

  const WebViewScreen({Key? key,@required this.appBarTitle, @required this.urlToRender}):super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        appBarTitle: widget.appBarTitle,
        isToCenterTitle: true,
      ),
      body: WebView(
        allowsInlineMediaPlayback: true,
        key: _key,
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.urlToRender,
        debuggingEnabled: true,
      ),
    );
  }
}
