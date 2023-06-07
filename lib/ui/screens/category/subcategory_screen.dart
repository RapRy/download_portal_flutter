import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

// models
import "package:download_portal/models/common/argument_models.dart";

// provider
import "package:download_portal/provider/content/content_provider.dart";

// widget
import "package:download_portal/ui/widget/common/avatar_heading_widget.dart";
import "package:download_portal/ui/widget/common/tap_retry_widget.dart";
import "package:skeletons/skeletons.dart";

// screens
import "package:download_portal/ui/screens/content/content_details_screen.dart";

class SubCategoryScreen extends ConsumerWidget {
  const SubCategoryScreen({super.key});
  static const routeName = "/sub-category";

  Widget _builLoader() {
    return SkeletonItem(
        child: SizedBox(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 6 / 7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Container(
              width: 90,
              margin: const EdgeInsets.only(right: 15),
              child: Column(
                children: [
                  const SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        // shape: BoxShape.circle,
                        width: double.infinity,
                        height: 90),
                  ),
                  const SizedBox(height: 5),
                  SkeletonParagraph(
                    style: const SkeletonParagraphStyle(
                        lines: 1,
                        lineStyle: SkeletonLineStyle(
                          height: 9,
                        )),
                  ),
                ],
              ),
            );
          }),
    ));
  }

  void _handleTapContent(Map<String, dynamic> args, BuildContext context) {
    Navigator.pushNamed(context, ContentDetailsScreen.routeName,
        arguments: args);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final catNameArg = args['cat'] as String;
    final subNameArg = args['sub'] as String;

    final CatSubCatModel finalArgs =
        CatSubCatModel(cat: catNameArg, sub: subNameArg);
    final subCategoryContents =
        ref.watch(subcategoryContentsProvider(finalArgs));

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text(""),
          leading: BackButton(
            color: Colors.black87,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AvatarHeadingWidget(
                isCategory: true,
                headTitle: "$catNameArg / $subNameArg",
              ),
              SizedBox(
                width: double.infinity,
                child: subCategoryContents.when(
                    skipLoadingOnRefresh: false,
                    data: (data) {
                      return GridView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 150,
                                  childAspectRatio: 6 / 7,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: data!.length,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () => _handleTapContent(
                                  {"content_id": data[index].id}, context),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        data[index].thumbnail as String,
                                        height: 90,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Flexible(
                                    child: Text(
                                      data[index].name as String,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    error: (error, _) {
                      return TapRetryWidget(provider: subCategoryContents);
                    },
                    loading: () {
                      return _builLoader();
                    }),
              )
            ],
          ),
        ));
  }
}
