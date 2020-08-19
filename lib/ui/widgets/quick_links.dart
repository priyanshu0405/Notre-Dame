import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:notredame/core/viewmodels/quick_links_viewmodel.dart';
import 'package:notredame/ui/views/security_view.dart';

class QuickLinksWidget extends StatelessWidget {
  final QuickLinks _links;
  const QuickLinksWidget(this._links);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Card(
        elevation: 4.0,
        child: InkWell(
          splashColor: Colors.red.withAlpha(50),
          onTap: () => onLinkClicked(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 40,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Image.asset(_links.image),
                  ),
                ),
                Text(
                  _links.name,
                  style: const TextStyle(color: Colors.red, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLinkClicked(BuildContext context) {
    if (_links.link == 'security') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecurityView()));
    } else {
      _launchInBrowser(_links.link);
    }
    /*Navigator.push(    //this option shows a webview with a back arrow
        context,
        MaterialPageRoute(
            builder: (context) => WebViewContainer(
                  selectedUrl: _links.link,
                  title: _links.name,
                )));*/
  }
}

Future<void> _launchInBrowser(String url) async {
  final ChromeSafariBrowser browser =
      ChromeSafariBrowser(); // this options opens urls with Chrome Custom Tabs on Android / SFSafariViewController on iOS. but needs minSdkVersion 17 and Xcode >= 11
  await browser.open(
      url: url,
      options: ChromeSafariBrowserClassOptions(
          android: AndroidChromeCustomTabsOptions(
              addDefaultShareMenuItem: false, toolbarBackgroundColor: "Red"),
          ios: IOSSafariOptions(
              barCollapsingEnabled: true, preferredBarTintColor: "Red")));

  /*if (await canLaunch(url)) {  //this option shows a webview or opens in browser
    await launch(
      url,
      enableJavaScript: true,
    );
  } else {
    throw 'Could not launch $url';
  }*/
}
