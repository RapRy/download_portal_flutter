import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";
import 'package:intl/intl.dart';

// models
import "package:download_portal/models/review/review_model.dart";

//widgets
import "package:download_portal/ui/widget/common/textfield_widget.dart";
import "package:download_portal/ui/widget/common/button_widget.dart";
import "package:download_portal/ui/widget/content/comments_widget.dart";

// providers
import "package:download_portal/provider/content/content_provider.dart";

class ReviewWidget extends ConsumerStatefulWidget {
  const ReviewWidget({super.key, required this.review});
  final ReviewModel review;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewWidgetState();
}

class _ReviewWidgetState extends ConsumerState<ReviewWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController commentFieldController = TextEditingController();
  FocusNode commentFieldFocus = FocusNode();
  List<CommentModel> _comments = [];
  bool isShowCommentBox = false;
  bool commentSubmitLoad = false;

  @override
  void initState() {
    final commentList = widget.review.comments as List<CommentModel>;
    setState(() {
      // _comments =
      //     List.from(widget.review.comments?.reversed as List<CommentModel>);

      _comments = List.from(commentList.reversed);
    });
    super.initState();
  }

  @override
  void dispose() {
    commentFieldController.dispose();
    super.dispose();
  }

  void handleToggleCommentBox() {
    setState(() {
      isShowCommentBox = !isShowCommentBox;
    });
  }

  void handleSubmitComment() {
    print(commentFieldController.text);
    final Map<String, String> data = {
      "contentId": widget.review.ref!.content as String,
      "reviewId": widget.review.id as String,
      "comment": commentFieldController.text
    };

    ref.read(commentNotifierProvider.notifier).handleWriteComment(data);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(commentNotifierProvider, (prevState, nextState) {
      setState(() {
        commentSubmitLoad = true;
      });
      if (nextState.hasValue &&
          nextState.value.ref.review == widget.review.id) {
        commentFieldController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          commentSubmitLoad = false;
          _comments = [nextState.value, ..._comments];
          isShowCommentBox = false;
        });
      }
    });

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.review.creator as String,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(widget.review.description as String,
              style: const TextStyle(
                  color: Colors.black87, height: 1.6, fontSize: 14)),
          const SizedBox(
            height: 3,
          ),
          SizedBox(
            width: double.infinity,
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                DateFormat.yMMMMd().format(widget.review.createdAt as DateTime),
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
              const Text("  |  "),
              Text(
                DateFormat.jm().format(widget.review.createdAt as DateTime),
                style: TextStyle(color: Colors.grey[700], fontSize: 13),
              ),
              const Text("  |  "),
              GestureDetector(
                onTap: handleToggleCommentBox,
                child: SizedBox(
                    width: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.comment, size: 18),
                        SizedBox(
                          width: 3,
                        ),
                        Text("Comment",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600))
                      ],
                    )),
              )
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
          if (isShowCommentBox)
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: commentFieldController,
                      currentInput: commentFieldFocus,
                      disable: commentSubmitLoad,
                      isPassword: false,
                      keyboardType: TextInputType.multiline,
                      nextInput: null,
                      label: "",
                      maxLine: 20,
                      minLine: 5,
                      submitForm: () => commentFieldController.text.isEmpty
                          ? null
                          : handleSubmitComment(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    commentSubmitLoad
                        ? const Center(
                            child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Color.fromRGBO(146, 220, 126, 1)),
                          ))
                        : CustomButtonWithIcon(
                            icon: Icons.send,
                            isLoading: commentSubmitLoad,
                            label: "Submit",
                            onPressEvent: () =>
                                commentFieldController.text.isEmpty
                                    ? null
                                    : handleSubmitComment())
                  ],
                )),
          if (_comments.isNotEmpty)
            const SizedBox(
              height: 15,
            ),
          if (_comments.isNotEmpty) CommentsWidget(comments: _comments)
        ],
      ),
    );
  }
}
