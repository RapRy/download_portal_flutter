import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

// model
import "package:download_portal/models/review/review_model.dart";

class CommentsWidget extends ConsumerStatefulWidget {
  const CommentsWidget({super.key, required this.comments});
  final List<CommentModel> comments;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends ConsumerState<CommentsWidget> {
  int showCount = 10;

  @override
  void initState() {
    setState(() {
      showCount = showCount > widget.comments.length
          ? widget.comments.length
          : showCount;
    });
    super.initState();
  }

  void handleShowMoreReviews() {
    int newCount = showCount + 7;
    final int listLength = widget.comments.length;

    if (newCount > listLength) {
      final difference = newCount - listLength;
      newCount = newCount - difference;
    }
    setState(() {
      showCount = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 0),
                shrinkWrap: true,
                itemCount: showCount,
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.comments[index].creator as String,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          Text(widget.comments[index].description as String,
                              style: const TextStyle(
                                  color: Colors.black87,
                                  height: 1.6,
                                  fontSize: 14)),
                          const SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.yMMMMd().format(widget
                                        .comments[index].createdAt as DateTime),
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 13),
                                  ),
                                  const Text("  |  "),
                                  Text(
                                    DateFormat.jm().format(widget
                                        .comments[index].createdAt as DateTime),
                                    style: TextStyle(
                                        color: Colors.grey[700], fontSize: 13),
                                  ),
                                ],
                              )),
                        ]),
                  );
                },
              )),
          if (widget.comments.isNotEmpty &&
              widget.comments.length > 7 &&
              showCount + 1 <= widget.comments.length)
            GestureDetector(
              onTap: handleShowMoreReviews,
              child: const Text("Show more comments",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600)),
            )
        ],
      ),
    );
  }
}
