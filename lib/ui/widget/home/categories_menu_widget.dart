import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter/material.dart";
import 'package:skeletons/skeletons.dart';

// widgets
import 'package:download_portal/ui/widget/common/tap_retry_widget.dart';
import 'package:download_portal/provider/category/category_provider.dart';

// screens
import 'package:download_portal/ui/screens/category/category_screen.dart';

final Map<String, IconData> icons = {
  "games": Icons.sports_esports,
  "videos": Icons.movie,
  "music": Icons.music_note,
  "apps": Icons.apps
};

class CategoriesMenuWidget extends ConsumerStatefulWidget {
  const CategoriesMenuWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CategoriesMenuWidgetState();
}

class _CategoriesMenuWidgetState extends ConsumerState<CategoriesMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final categoriesMenu = ref.watch(categoriesMenuProvider);

    Widget buildLoader() {
      return SkeletonItem(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (ctx, index) {
              return const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      height: 250,
                      width: double.infinity));
            }),
      ));
    }

    return Container(
      child: categoriesMenu.when(
          skipLoadingOnRefresh: false,
          data: (data) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: data.length,
                  itemBuilder: (ctx, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CategoryScreen.routeName,
                            arguments: data[index].catName);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                colors: <Color>[
                                  Color.fromRGBO(146, 220, 126, 1),
                                  Color.fromRGBO(0, 223, 207, 1),
                                ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(icons[data[index].catName?.toLowerCase()],
                                size: 35),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data[index].catName as String,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ));
          },
          error: (error, _) {
            return TapRetryWidget(provider: categoriesMenuProvider);
          },
          loading: () => buildLoader()),
    );
  }
}
