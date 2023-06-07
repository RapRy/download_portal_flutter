import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeletons/skeletons.dart';

// providers
import "package:download_portal/provider/content/content_provider.dart";

// widget
import "package:download_portal/ui/widget/common/tap_retry_widget.dart";

// screens
import "package:download_portal/ui/screens/content/content_details_screen.dart";

class FeaturedWidget extends ConsumerWidget {
  const FeaturedWidget({super.key});

  Widget buildLoader() {
    return SkeletonItem(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SkeletonAvatar(
            style: SkeletonAvatarStyle(width: 135, height: 28),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            // width: MediaQuery.of(context).size.width,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(color: Colors.amber),
            child: const SkeletonAvatar(
              style: SkeletonAvatarStyle(height: 180, width: double.infinity),
            )),
      ],
    ));
  }

  void _handleTapContent(Map<String, dynamic> args, BuildContext context) {
    Navigator.pushNamed(context, ContentDetailsScreen.routeName,
        arguments: args);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredItems = ref.watch(featuredProvider);

    return SizedBox(
        width: double.infinity,
        child: featuredItems.when(
            skipLoadingOnRefresh: false,
            data: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "FEATURED",
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 180,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                    ),
                    items: data!.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            onTap: () => _handleTapContent(
                                {"content_id": item.id}, context),
                            child: Container(
                                // width: MediaQuery.of(context).size.width,
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.network(
                                          item.banner as String,
                                          height: 180,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        child: Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: <Color>[
                                                Colors.black,
                                                Colors.black54,
                                                Colors.transparent
                                              ],
                                                  begin: AlignmentDirectional
                                                      .bottomEnd)),
                                        ),
                                      ),
                                      Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  item.thumbnail as String,
                                                  width: 60,
                                                  height: 60,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                item.name as String,
                                                textAlign: TextAlign.end,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ))
                                    ])),
                          );
                        },
                      );
                    }).toList(),
                  )
                ],
              );
            },
            error: (error, _) {
              return TapRetryWidget(
                provider: featuredProvider,
              );
            },
            loading: () {
              // return const Center(child: CircularProgressIndicator());
              return buildLoader();
            }));
  }
}
