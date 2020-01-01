///
/// @author: FTL
/// @date: 2020-01-01 14:33
/// @desc: webview
///
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewPage extends StatelessWidget {
  final String url;
  final String title;

  WebviewPage({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "$url",
      appBar: AppBar(
        title: Text("$title"),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
