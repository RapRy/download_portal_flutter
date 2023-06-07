import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

// model
import "package:download_portal/models/review/review_model.dart";

// widget
import "package:download_portal/ui/widget/content/review_widget.dart";
import "package:download_portal/ui/widget/common/textfield_widget.dart";
import "package:download_portal/ui/widget/common/button_widget.dart";

// provider
import "package:download_portal/provider/content/content_provider.dart";

class ReviewsWidget extends ConsumerStatefulWidget {
  const ReviewsWidget(
      {super.key, required this.contentId, required this.reviewsList});
  final String contentId;
  final List<ReviewModel> reviewsList;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewsWidgetState();
}

class _ReviewsWidgetState extends ConsumerState<ReviewsWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController reviewFieldController = TextEditingController();
  FocusNode reviewFieldFocus = FocusNode();
  List<ReviewModel> _reviewList = [];
  int showCount = 5;
  bool replySubmitLoad = false;

  @override
  void initState() {
    setState(() {
      _reviewList = List.from(widget.reviewsList.reversed);
      showCount = showCount > widget.reviewsList.length
          ? widget.reviewsList.length
          : showCount;
    });
    super.initState();
  }

  @override
  void dispose() {
    reviewFieldController.dispose();
    super.dispose();
  }

  void handleReviewSubmit(contentId) async {
    final Map<String, String> data = {
      "contentId": contentId,
      "review": reviewFieldController.text
    };
    ref.read(reviewNotifierProvider.notifier).handleWriteReview(data);
  }

  void handleShowMoreReviews() {
    int newCount = showCount + 5;
    final int listLength = _reviewList.length;

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
    // final reviewContent = ref.watch(reviewNotifierProvider);

    ref.listen<AsyncValue>(reviewNotifierProvider, (prevState, nextState) {
      setState(() {
        replySubmitLoad = true;
      });

      if (nextState.hasValue) {
        reviewFieldController.clear();
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          replySubmitLoad = false;
          _reviewList = [nextState.value, ..._reviewList];
        });
      }
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Reviews",
            style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w600),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: reviewFieldController,
                  isPassword: false,
                  currentInput: reviewFieldFocus,
                  label: "",
                  nextInput: null,
                  disable: replySubmitLoad,
                  keyboardType: TextInputType.multiline,
                  submitForm: () => handleReviewSubmit(widget.contentId),
                  maxLine: 20,
                  minLine: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                replySubmitLoad
                    ? const Center(
                        child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromRGBO(146, 220, 126, 1)),
                      ))
                    : CustomButtonWithIcon(
                        icon: Icons.send,
                        isLoading: replySubmitLoad,
                        label: "Submit",
                        onPressEvent: () => reviewFieldController.text.isEmpty
                            ? null
                            : handleReviewSubmit(widget.contentId))
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (_reviewList.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  shrinkWrap: true,
                  itemCount: showCount,
                  itemBuilder: (ctx, index) {
                    return ReviewWidget(
                      review: _reviewList[index],
                    );
                  }),
            ),
          if (_reviewList.isNotEmpty &&
              _reviewList.length > 5 &&
              showCount + 1 <= _reviewList.length)
            GestureDetector(
              onTap: handleShowMoreReviews,
              child: const Text("Show more reviews",
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
