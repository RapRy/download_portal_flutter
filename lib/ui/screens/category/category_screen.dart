import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:skeletons/skeletons.dart";

// provider
import "package:download_portal/provider/content/content_provider.dart";

// widgets
import "package:download_portal/ui/widget/common/tap_retry_widget.dart";
import "package:download_portal/ui/widget/common/avatar_heading_widget.dart";

// screens
import "package:download_portal/ui/screens/category/subcategory_screen.dart";
import "package:download_portal/ui/screens/content/content_details_screen.dart";

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});
  static const routeName = "/category";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  Widget _buildLoader() {
    return SkeletonItem(
      child: Column(
        children: [1, 2, 3, 4].map((item) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                          lines: 1,
                          lineStyle: SkeletonLineStyle(
                            height: 16,
                            width: 60,
                          )),
                    ),
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(
                          lines: 1,
                          lineStyle: SkeletonLineStyle(
                            height: 16,
                            width: 50,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (ctx, index) {
                        return Container(
                          width: 90,
                          margin: const EdgeInsets.only(right: 15),
                          child: Column(
                            children: [
                              const SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
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
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  void _handleRedirectSubCategory(Map<String, String> args) {
    Navigator.pushNamed(context, SubCategoryScreen.routeName, arguments: args);
  }

  void _handleTapContent(Map<String, dynamic> args) {
    Navigator.pushNamed(context, ContentDetailsScreen.routeName,
        arguments: args);
  }

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)!.settings.arguments;
    final categoryContents =
        ref.watch(categoryContentsProvider(categoryName as String));

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
              headTitle: categoryName,
            ),
            SizedBox(
              width: double.infinity,
              child: categoryContents.when(
                  skipLoadingOnRefresh: false,
                  data: (data) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        // scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: data?.length,
                        itemBuilder: (ctx, index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data![index].subCategory.subCatName
                                        as String,
                                    style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  GestureDetector(
                                      onTap: () => _handleRedirectSubCategory({
                                            "cat": categoryName,
                                            "sub": data[index]
                                                .subCategory
                                                .subCatName as String
                                          }),
                                      child: const Text(
                                        "View all",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      )),
                                ],
                              ),
                              const Divider(
                                  color: Colors.black87, thickness: 1),
                              SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: data[index].contents.length,
                                    itemBuilder: (ctx2, index2) {
                                      return Container(
                                          width: 90,
                                          margin:
                                              const EdgeInsets.only(right: 15),
                                          child: InkWell(
                                            onTap: () => _handleTapContent({
                                              "content_id": data[index]
                                                  .contents[index2]
                                                  .id
                                            }),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Image.network(
                                                      data[index]
                                                          .contents[index2]
                                                          .thumbnail as String,
                                                      height: 90,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    )),
                                                const SizedBox(height: 5),
                                                Flexible(
                                                  child: Text(
                                                    data[index]
                                                        .contents[index2]
                                                        .name as String,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    softWrap: false,
                                                    textAlign: TextAlign.left,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ));
                                    }),
                              ),
                              SizedBox(
                                height: index == data.length - 1 ? 0 : 10,
                              )
                            ],
                          );
                        });
                  },
                  error: (error, _) {
                    return TapRetryWidget(provider: categoryContents);
                  },
                  loading: () {
                    return _buildLoader();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
