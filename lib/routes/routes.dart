import "package:flutter/material.dart";

import '../ui/screens/auth/sign_in_screen.dart';
import '../ui/screens/home/home.dart';
import "../ui/screens/auth/sign_up_screen.dart";
import "package:download_portal/ui/screens/category/category_screen.dart";
import "package:download_portal/ui/screens/category/subcategory_screen.dart";
import "package:download_portal/ui/screens/content/content_details_screen.dart";
import "package:download_portal/ui/screens/account/account_overview.dart";

class RouterNames {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignInScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case Home.routeName:
        return MaterialPageRoute(builder: (_) => const Home());
      case SignUpScreen.routeName:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case CategoryScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const CategoryScreen(), settings: settings);
      case SubCategoryScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const SubCategoryScreen(), settings: settings);
      case ContentDetailsScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const ContentDetailsScreen(), settings: settings);
      case AccountOverviewScreen.routeName:
        return MaterialPageRoute(
            builder: (_) => const AccountOverviewScreen(), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Not found')),
                ));
    }
  }
}
