import "package:download_portal/models/review/review_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import "package:skeletons/skeletons.dart";

// provider
import "package:download_portal/provider/content/content_provider.dart";

// widgets
import "package:download_portal/ui/widget/common/tap_retry_widget.dart";
import "package:download_portal/ui/widget/common/avatar_heading_widget.dart";
import "package:download_portal/ui/widget/content/reviews_widget.dart";
import "package:download_portal/ui/widget/common/button_widget.dart";

class ContentDetailsScreen extends ConsumerStatefulWidget {
  const ContentDetailsScreen({super.key});

  static const routeName = "/content-details";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ContentDetailsScreenState();
}

class _ContentDetailsScreenState extends ConsumerState<ContentDetailsScreen> {
  bool _isShowMoreDescrip = false;

  Widget _buildLoaderFooter() {
    return const SkeletonItem(
        child: SkeletonAvatar(
      style: SkeletonAvatarStyle(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          width: double.infinity,
          height: 50),
    ));
  }

  Widget _builLoaderMain() {
    return SkeletonItem(
      child: Column(
        children: [
          SizedBox(
            height: 190,
            child: Stack(alignment: AlignmentDirectional.topStart, children: [
              Positioned(
                left: 0,
                top: 90,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                width: 100,
                                height: 100)),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SkeletonParagraph(
                                  style: const SkeletonParagraphStyle(
                                      lines: 1,
                                      lineStyle: SkeletonLineStyle(
                                        height: 16,
                                      )),
                                ),
                                SkeletonParagraph(
                                  style: const SkeletonParagraphStyle(
                                      lines: 1,
                                      lineStyle: SkeletonLineStyle(
                                        height: 12,
                                      )),
                                )
                              ]),
                        )
                      ]),
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          const SkeletonAvatar(
              style: SkeletonAvatarStyle(width: double.infinity, height: 400)),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SkeletonParagraph(
                style: const SkeletonParagraphStyle(
                    lines: 1,
                    lineStyle: SkeletonLineStyle(
                      width: 150,
                      height: 14,
                    )),
              ),
              const SizedBox(
                height: 3,
              ),
              SkeletonParagraph(
                style: const SkeletonParagraphStyle(
                    lines: 5,
                    lineStyle: SkeletonLineStyle(
                      height: 12,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SkeletonParagraph(
                style: const SkeletonParagraphStyle(
                    lines: 1,
                    lineStyle: SkeletonLineStyle(
                      width: 120,
                      height: 14,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      width: double.infinity,
                      height: 200)),
              const SizedBox(
                height: 3,
              ),
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    width: double.infinity,
                    height: 50),
              )
            ]),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final contentId = args['content_id'];
    final contentDetails = ref.watch(contentDetailsProvider(contentId));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(""),
        leading: BackButton(
          color: Colors.black87,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.all(20),
          child: contentDetails.isLoading
              ? _buildLoaderFooter()
              : CustomButtonWithIcon(
                  icon: Icons.download,
                  isLoading: false,
                  label:
                      "Download (${contentDetails.value?.content?.filesize} mb)",
                  onPressEvent: null,
                )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          // padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: contentDetails.when(
              data: (data) {
                return Column(
                  children: [
                    SizedBox(
                      height: 190,
                      child: Stack(
                          alignment: AlignmentDirectional.topStart,
                          children: [
                            const AvatarHeadingWidget(
                                isCategory: true, headTitle: ""),
                            Positioned(
                              left: 0,
                              top: 90,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            data?.content?.thumbnail as String,
                                            height: 100,
                                            width: 100,
                                            fit: BoxFit.cover,
                                          )),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              data?.content?.name as String,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              data?.content?.catName as String,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            )
                                          ],
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemCount: data!.content!.screenshots!.length,
                            itemBuilder: (ctx, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    right: data.content!.screenshots!.length ==
                                            index + 1
                                        ? 0
                                        : 20),
                                child: Image.network(
                                  data.content!.screenshots![index],
                                  height: 350,
                                  width: MediaQuery.of(context).size.width - 50,
                                  fit: BoxFit.cover,
                                ),
                              );
                            })),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(data.content!.description as String,
                                maxLines: _isShowMoreDescrip ? 1000 : 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black87, height: 1.6)),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isShowMoreDescrip = !_isShowMoreDescrip;
                                });
                              },
                              child: Text(
                                  !_isShowMoreDescrip
                                      ? "Show more"
                                      : "Show less",
                                  style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    ReviewsWidget(
                      contentId: contentId,
                      reviewsList: data.reviews as List<ReviewModel>,
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                );
              },
              error: (error, _) {
                return TapRetryWidget(provider: contentDetails);
              },
              loading: () => _builLoaderMain()),
        ),
      ),
    );
  }
}
