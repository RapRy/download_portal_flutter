import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:download_portal/ui/widget/home/categories_menu_widget.dart";
import "package:download_portal/ui/widget/home/featured_widget.dart";
import 'package:download_portal/ui/widget/common/avatar_heading_widget.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AvatarHeadingWidget(
              isHome: true,
            ),
            FeaturedWidget(),
            SizedBox(height: 30),
            CategoriesMenuWidget(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
