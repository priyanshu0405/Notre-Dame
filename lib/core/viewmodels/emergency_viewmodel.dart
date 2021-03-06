import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:notredame/core/viewmodels/security_viewmodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmergencyViewModel extends SecurityViewModel {
  WebViewController webViewController;

  /// used to load the emergency procedures html files inside the webView
  Future loadHtmlFromAssets(String filename, BuildContext context) async {
    final String fileText = await rootBundle.loadString(filename);

    final String data = Uri.dataFromString(darkMode(fileText, context),
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    await webViewController.loadUrl(data);
  }

  /// used to add dark theme to emergency procedures html files
  String darkMode(String fileText, BuildContext context) {
    String colorFileText = fileText;
    if (MediaQuery.platformBrightnessOf(context) == Brightness.dark) {
      colorFileText = colorFileText.replaceAll('<html>',
          "<html> <style> body { background-color: black; color: white;} </style>");
    }
    return colorFileText;
  }
}
