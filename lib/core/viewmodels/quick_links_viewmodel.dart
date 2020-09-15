// FLUTTER / DART / THIRD-PARTIES
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:stacked/stacked.dart';

//SERVICE
import 'package:notredame/core/services/navigation_service.dart';

// MODEL
import 'package:notredame/core/models/quick_link.dart';

// CONSTANT
import 'package:notredame/core/constants/quick_links.dart';
import 'package:notredame/core/constants/router_paths.dart';

//OTHER
import 'package:notredame/locator.dart';

class QuickLinksViewModel extends BaseViewModel {
  /// used to get all links for ETS page
  List<QuickLink> quickLinkList = quickLinks;

  /// used to redirect on the security.
  final NavigationService _navigationService = locator<NavigationService>();

  /// used to open a website or the security view
  void onLinkClicked(QuickLink links) {
    if (links.link == 'security') {
      _navigationService.pushNamed(RouterPaths.security);
    } else {
      _launchInBrowser(links.link);
    }
  }

  /// used to open a website inside AndroidChromeCustomTabs or SFSafariViewController
  Future _launchInBrowser(String url) async {
    final ChromeSafariBrowser browser = ChromeSafariBrowser();
    await browser.open(
        url: url,
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(
                addDefaultShareMenuItem: false, toolbarBackgroundColor: "Red"),
            ios: IOSSafariOptions(
                barCollapsingEnabled: true, preferredBarTintColor: "Red")));
  }
}
