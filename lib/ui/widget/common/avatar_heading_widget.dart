import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

// widgets
import "package:download_portal/ui/widget/common/top_bg_widget.dart";

// provider
import "package:download_portal/provider/preference/preference_provider.dart";

// route
import "package:download_portal/ui/screens/account/account_overview.dart";

class AvatarHeadingWidget extends ConsumerWidget {
  const AvatarHeadingWidget(
      {super.key,
      this.headTitle = "",
      this.isHome = false,
      this.isCategory = false,
      this.isAccount = false});
  final bool isHome;
  final bool isCategory;
  final bool isAccount;
  final String? headTitle;

  void _handleRedirectToAccountOverview(BuildContext context) {
    Navigator.pushNamed(context, AccountOverviewScreen.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCredentials = ref.read(preferenceProvider).getUserCredential();

    if (isAccount) {
      return TopBgWidget(
        height: 280,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 15, right: 15),
        childOfContainer: Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60,
            child: GestureDetector(
              onTap: () => _handleRedirectToAccountOverview(context),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(userCredentials?.proPic != ""
                      ? userCredentials?.proPic as String
                      : "https://picsum.photos/200"),
                  radius: 58),
            ),
          ),
        ),
      );
    }

    if (isHome) {
      return TopBgWidget(
        height: 280,
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20, left: 15, right: 15),
        childOfContainer: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 27,
                child: GestureDetector(
                  onTap: () => _handleRedirectToAccountOverview(context),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          userCredentials?.proPic != ""
                              ? userCredentials?.proPic as String
                              : "https://picsum.photos/200"),
                      radius: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(child: Image.asset("assets/images/logo.png"))
          ],
        ),
      );
    }

    if (isCategory) {
      return TopBgWidget(
        isCurve: false,
        height: 150,
        padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
        childOfContainer: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 27,
                child: GestureDetector(
                  onTap: () => _handleRedirectToAccountOverview(context),
                  child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          userCredentials?.proPic != ""
                              ? userCredentials?.proPic as String
                              : "https://picsum.photos/200"),
                      radius: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              headTitle as String,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    }

    return TopBgWidget(
        height: 280,
        childOfContainer: Center(child: Image.asset("assets/images/logo.png")));
  }
}
